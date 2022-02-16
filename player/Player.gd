extends KinematicBody

# ------ variables ------
export var coyote_timer = 0.05
onready var graphics = $Graphics
onready var anim_player = $Graphics/AnimationPlayer

# constants
const WALK_SPEED = 5
const SPRINT_SPEED = 7
const JUMP_FORCE = 10.6
const D_JUMP_FORCE = 8.6
const GRAVITY = 24
const MAX_FALL_SPEED = 70
const FALL_MULTIPLIER = 1.5

# movement
var y_velo = -0.1
var grounded = false
var can_jump = false
var colliding_right = false
var colliding_left = false
var just_jumped = false
var jump_state = JumpStateEnum.GROUNDED
var gravity_multiplier = 1

# animation
var facing_right = true
var walk_anim_speed = 1.3

# power ups
var has_double_jump = false

# gear
onready var right_hand_holder = $Graphics/Armature/Skeleton/RightHandPlaceholder
onready var left_hand_holder = $Graphics/Armature/Skeleton/LeftHandPlaceholder
var weapon = null
var shield = null
var items = {
	"sword1": preload("res://items/attack/Sword.tscn")
}


# ------ start and loop ------
func _ready():
	Signals.connect("get_power_up", self, "_get_power_up")
	equipWeapon(items.sword1)
 
func _physics_process(delta):
	transform.origin.z = 0
	var move_dir = apply_movement()
	apply_jump(delta)
	apply_double_jump(delta)
	check_fall()
	play_animations(move_dir)
	check_grounded()
 
func play_anim(anim, speed = 1):
	if anim_player.current_animation == anim and anim_player.get_playing_speed() == speed:
		return
	anim_player.set_speed_scale(speed)
	anim_player.play(anim)

func apply_movement():
	walk_anim_speed = 1.3
	var move_dir = DirectionEnum.IDLE
	var movement_modifier = WALK_SPEED
	if Input.is_action_pressed("move_right") and !colliding_right:
		move_dir = DirectionEnum.RIGHT
	if Input.is_action_pressed("move_left") and !colliding_left:
		move_dir = DirectionEnum.LEFT
	if Input.is_action_pressed("sprint"):
		walk_anim_speed = 2
		movement_modifier = SPRINT_SPEED
	var move_result = move_and_slide(Vector3(move_dir * movement_modifier, y_velo, 0), Vector3(0,1,0))
	y_velo = move_result.y
	return move_dir
	
func apply_jump(delta):
	just_jumped = false
	y_velo -= GRAVITY * delta * gravity_multiplier
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if can_jump:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = JUMP_FORCE
			just_jumped = true
			jump_state = JumpStateEnum.JUMP
	else:
		if Input.is_action_just_released("jump"):
			if jump_state == JumpStateEnum.JUMP:
				jump_state = JumpStateEnum.JUMP_FALL
			elif jump_state == JumpStateEnum.DOUBLE_JUMP:
				jump_state = JumpStateEnum.DOUBLE_JUMP_FALL

func apply_double_jump(delta):
	if Input.is_action_pressed("jump"):
		if jump_state == JumpStateEnum.JUMP_FALL and has_double_jump:
			y_velo = D_JUMP_FORCE
			just_jumped = true
			jump_state = JumpStateEnum.DOUBLE_JUMP
	
func check_fall():
	var falling = jump_state == JumpStateEnum.JUMP_FALL or jump_state == JumpStateEnum.DOUBLE_JUMP_FALL
	if falling:
		if y_velo > 0:
			y_velo = lerp(y_velo, 0, 0.2)
		else:
			gravity_multiplier = FALL_MULTIPLIER
	elif jump_state == JumpStateEnum.JUMP and y_velo < 0:
		gravity_multiplier = FALL_MULTIPLIER
	else:
		gravity_multiplier = 1

func play_animations(move_dir):
	var falling = jump_state == JumpStateEnum.JUMP_FALL or jump_state == JumpStateEnum.DOUBLE_JUMP_FALL
	if move_dir == DirectionEnum.LEFT and facing_right:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right:
		flip()

	if just_jumped:
		play_anim("walk", 1.2) # mudar pra jump qnd animação certa
	elif !grounded and falling:
		play_anim("fall")
	elif grounded:
		if move_dir == DirectionEnum.IDLE:
			play_anim("idle")
		else:
			play_anim("walk", walk_anim_speed)
			
func check_grounded():
	if grounded:
		can_jump = true
		jump_state = JumpStateEnum.GROUNDED
	if !grounded && can_jump:
		coyote_time()

func flip():
	graphics.rotation_degrees.y *= -1
	facing_right = !facing_right

func coyote_time():
	yield(get_tree().create_timer(coyote_timer),"timeout")
	can_jump = false
	
func equipWeapon(preloadedItem):
	weapon = preloadedItem.instance()
	left_hand_holder.add_child(weapon)
	
func equipShield(preloadedItem):
	shield = preloadedItem.instance()
	right_hand_holder.add_child(shield)


# ------ signals ------
func _get_power_up(power):
	if power == "double_jump":
		has_double_jump = true

func _on_AreaRight_body_entered(body):
	if body.name == "GridMap":
		colliding_right = true

func _on_AreaLeft_body_entered(body):
	if body.name == "GridMap":
		colliding_left = true
		
func _on_AreaRight_body_exited(body):
	if body.name == "GridMap":
		colliding_right = false

func _on_AreaLeft_body_exited(body):
	if body.name == "GridMap":
		colliding_left = false

func _on_AreaBottom_body_entered(body):
	if body.name == "GridMap":
		grounded = true

func _on_AreaBottom_body_exited(body):
	if body.name == "GridMap":
		grounded = false
