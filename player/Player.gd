extends CharacterBody3D

# ------ variables ------
@export var hp = 10
@export var coyote_timer = 0.05
@export var damage_timer = 0.15
@onready var graphics = $Graphics
@onready var anim_player = $Graphics/AnimationPlayer
@onready var gravity_manager = $KinematicGravity
@onready var ground_check_right = $GroundCheckRayRight
@onready var ground_check_left = $GroundCheckRayLeft
@onready var headbump_check = $HeadCheckRay
@onready var area_right = $AreaRight
@onready var area_left = $AreaLeft
@onready var area_bottom = $AreaBottom
@onready var hit_count_spawner = $HitCountSpawner
@onready var sound_manager = $SoundManager

# constants
const WALK_SPEED = 7
const CROUCH_SPEED = 5
const JUMP_FORCE = 12
const D_JUMP_FORCE = 9
const DAMAGE_KICK = 14

# movement
var headbump = false
var grounded = false
var previous_grounded = false
var can_jump = false
var released_jump = true
var colliding_right = false
var colliding_left = false
var just_jumped = false
var just_landed = false
var jump_state = JumpStateEnum.GROUNDED

# combat
var damaged = false
var play_damaged_sound = false
var x_axis_damage_kick = 0
var attacking = false
var play_attack_sound = false
var attack_anim_speed = 1
var max_hp = 10

# animation
var facing_right = true
var walk_anim_speed = 0.8
var is_on_edge_left = false
var is_on_edge_right = false

# power ups
var has_double_jump = false

# gear
@onready var right_hand_holder = $Graphics/Armature/Skeleton3D/RightHandPlaceholder
@onready var left_hand_holder = $Graphics/Armature/Skeleton3D/LeftHandPlaceholder
var weapon = null
var shield = null
var items = {
	"sword1": preload("res://player/items/attack/Sword.tscn")
}

# ------ start and loop ------
func _ready():
	Signals.connect("get_power_up", _get_power_up)
	Signals.connect("damage_player", _damage_player)
	max_hp = hp
	equip_weapon(items.sword1)
	load_checkpoint()
 
func _physics_process(delta):
	transform.origin.z = 0
	var move_dir = DirectionEnum.IDLE
	if !GlobalState.camera.on_cutscene:
		move_dir = apply_movement()
		apply_jump(delta)
		apply_double_jump(delta)
	check_fall_modifiers()
	play_animations(move_dir)
	play_sounds(move_dir)
	check_grounded()
	check_headbump()
 
func play_anim(anim, speed = 1):
	if anim_player.current_animation == anim and anim_player.get_playing_speed() == speed:
		return
	anim_player.set_speed_scale(speed)
	anim_player.play(anim)

func apply_movement():
	walk_anim_speed = 1
	var move_dir = DirectionEnum.IDLE
	var movement_modifier = WALK_SPEED
	if Input.is_action_pressed("move_right") and !colliding_right:
		move_dir = DirectionEnum.RIGHT
	if Input.is_action_pressed("move_left") and !colliding_left:
		move_dir = DirectionEnum.LEFT
	if Input.is_action_pressed("crouch"):
		walk_anim_speed = 0.8
		movement_modifier = CROUCH_SPEED
	reset_damage_kick()
	set_velocity(Vector3((move_dir * movement_modifier) + x_axis_damage_kick, gravity_manager.y_velo, 0))
	set_up_direction(Vector3(0,1,0))
	move_and_slide()
	var move_result = velocity
	return move_dir
	
func reset_damage_kick():
	if !damaged and x_axis_damage_kick != 0:
		x_axis_damage_kick = lerpf(x_axis_damage_kick, 0.0, 0.1)
		if x_axis_damage_kick > -0.1 and x_axis_damage_kick < 0.1:
			x_axis_damage_kick = 0
	
func apply_jump(delta):
	just_jumped = false
	if jump_state == JumpStateEnum.JUMP or jump_state == JumpStateEnum.DOUBLE_JUMP:
		released_jump = Input.is_action_just_released("jump") or headbump
	elif Input.is_action_just_released("jump") or headbump:
		released_jump = true
		
	if can_jump:
		gravity_manager.y_velo = -0.1
		if Input.is_action_pressed("jump") and released_jump:
			gravity_manager.y_velo = JUMP_FORCE
			just_jumped = true
			can_jump = false
			jump_state = JumpStateEnum.JUMP
	else:
		if Input.is_action_just_released("jump") or headbump:
			if jump_state == JumpStateEnum.JUMP:
				jump_state = JumpStateEnum.JUMP_FALL
			elif jump_state == JumpStateEnum.DOUBLE_JUMP:
				jump_state = JumpStateEnum.DOUBLE_JUMP_FALL

func apply_double_jump(delta):
	if Input.is_action_pressed("jump"):
		if jump_state == JumpStateEnum.JUMP_FALL and has_double_jump:
			gravity_manager.y_velo = D_JUMP_FORCE
			just_jumped = true
			jump_state = JumpStateEnum.DOUBLE_JUMP
	
func check_fall_modifiers():
	var key_released = jump_state == JumpStateEnum.JUMP_FALL or jump_state == JumpStateEnum.DOUBLE_JUMP_FALL
	if key_released:
		if gravity_manager.y_velo > 0:
			gravity_manager.y_velo = lerpf(gravity_manager.y_velo, 0.0, 0.2)
		else:
			gravity_manager.gravity_multiplier = gravity_manager.FALL_MULTIPLIER
	elif jump_state == JumpStateEnum.JUMP and gravity_manager.y_velo < -0.1:
		gravity_manager.gravity_multiplier = gravity_manager.FALL_MULTIPLIER
	else:
		gravity_manager.gravity_multiplier = 1
	
func apply_damage_kick(direction, strenght):
	if !damaged:
		damaged = true
		gravity_manager.y_velo = DAMAGE_KICK * 0.8
		if strenght > 1:
			x_axis_damage_kick = (DAMAGE_KICK * strenght) * direction
			damage_time()
		else:
			x_axis_damage_kick = DAMAGE_KICK * direction
			damage_time()

func play_animations(move_dir):
	var falling = jump_state == JumpStateEnum.JUMP_FALL or jump_state == JumpStateEnum.DOUBLE_JUMP_FALL
	if move_dir == DirectionEnum.LEFT and facing_right:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right:
		flip()
		
	if damaged:
		visible = false if Engine.get_frames_drawn() % 4 == 0 else true
	if !damaged:
		visible = true
		
	if just_jumped:
		play_anim("jump")
	elif !grounded and gravity_manager.y_velo < 0:
		play_anim("fall", 0.5)
	elif just_landed:
		play_anim("land", 1.6)
	elif grounded:
		if move_dir == DirectionEnum.IDLE and (is_on_edge_left or is_on_edge_right):
			play_anim("edge", 0.8)
		elif move_dir == DirectionEnum.IDLE and !attacking:
			play_anim("idle")
		elif attacking:
			play_anim("attack_sword", attack_anim_speed)
		else:
			play_anim("walk", walk_anim_speed)
			
func play_sounds(move_dir):
	if play_damaged_sound:
		play_damaged_sound = false
		sound_manager.play_damage(5)
		sound_manager.play_pain(5, 1.4)
	if play_attack_sound:
		play_attack_sound = false
		sound_manager.play_attack(2, 1)
	if grounded and (move_dir != DirectionEnum.IDLE):
		sound_manager.play_grass_step(2, 1.6)
			
				
func attack(anim_speed):
	play_attack_sound = true
	attack_anim_speed = anim_speed
	attack_timer(0.5)
			
func check_grounded():
	is_on_edge_left = ground_check_right.is_colliding() and !ground_check_left.is_colliding()
	is_on_edge_right = !ground_check_right.is_colliding() and ground_check_left.is_colliding()
	grounded = ground_check_right.is_colliding() or ground_check_left.is_colliding()
	if grounded:
		if !previous_grounded:
			land_timer(0.25)
		can_jump = true
		jump_state = JumpStateEnum.GROUNDED
	if !grounded and can_jump and jump_state == JumpStateEnum.GROUNDED:
		coyote_time()
	previous_grounded = grounded
	
func check_headbump():
	headbump = headbump_check.is_colliding()

func flip():
	var degrees = 90
	facing_right = !facing_right
	if !facing_right:
		degrees = -90
	graphics.rotation_degrees.y = degrees

func coyote_time():
	await get_tree().create_timer(coyote_timer).timeout
	can_jump = false
	
func damage_time():
	await get_tree().create_timer(damage_timer).timeout
	damaged = false
	
func land_timer(time):
	just_landed = true
	await get_tree().create_timer(time).timeout
	just_landed = false
	
func attack_timer(time):
	attacking = true
	await get_tree().create_timer(time).timeout
	attacking = false
	
func equip_weapon(preloadedItem):
	weapon = preloadedItem.instantiate()
	left_hand_holder.add_child(weapon)
	
func equip_shield(preloadedItem):
	shield = preloadedItem.instantiate()
	right_hand_holder.add_child(shield)
	
func heal_player(hp_given):
	hp += hp_given
	Signals.emit_signal("update_hud", hp, max_hp)

func load_checkpoint():
	if GlobalState.checkpoint_save.has_saved:
		global_transform.origin.x = GlobalState.checkpoint_save.checkpoint_x
		global_transform.origin.y = GlobalState.checkpoint_save.checkpoint_y
		has_double_jump = GlobalState.checkpoint_save.player.has_double_jump

# ------ signals ------
func _get_power_up(power):
	if power == "double_jump":
		has_double_jump = true
		
func _damage_player(damage, on_right, strenght):
	if on_right:
		apply_damage_kick(-1, strenght)
	else:
		apply_damage_kick(1, strenght)
	play_damaged_sound = true
	hp -= damage
	Signals.emit_signal("update_hud", hp, max_hp)
	if is_instance_valid(hit_count_spawner):
		hit_count_spawner.spawn_hit_count(damage)
	if hp <= 0:
		get_tree().reload_current_scene()

func _on_AreaRight_body_entered(body):
	colliding_right = true

func _on_AreaLeft_body_entered(body):
	colliding_left = true
		
func _on_AreaRight_body_exited(body):
	colliding_right = false

func _on_AreaLeft_body_exited(body):
	colliding_left = false
