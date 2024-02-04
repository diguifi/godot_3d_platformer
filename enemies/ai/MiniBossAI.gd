extends Node3D

enum states {
	IDLE,
	CHASING,
	FLOOR_HIT,
	STUCK,
	RELEASING,
	THROW_START,
	THROW_MISS,
	THREW
}

@export var boss_speed_modifier = 1.0
@export var chase_speed = 1.8
@export var throw_damage = 2
@export var floor_hit_damage = 2
@export var floor_hit_delay = 0.4
@export var throw_start_time = 0.5
@export var throw_miss_time = 1.6
@export var throwing_time = 2.1
@export var floor_hit_time = 2.3
@export var stuck_time = 3.3
@export var releasing_time = 2.2
@export var chasing_time = 6
@onready var player_node = get_node("/root/World/Player")
@onready var boss: CharacterBody3D = get_parent()
@onready var claw = get_parent().get_node("Graphics/Armature/Skeleton3D/Claw")
@onready var ray_right = $RayCastRight
@onready var ray_left = $RayCastLeft
var grab_distance = 5
var grabbing = false
var default_chase_speed = 0
var facing_right = true
var chasing_direction = 1
var move_dir = DirectionEnum.RIGHT
var move_speed = 1.5
var state = states.IDLE
var state_changed = false
var frame_state_changed = 0
var amount_hit_ground_effect = 4
var hit_ground_effect_preload = preload("res://enemies/bosses/BossPowerEffect.tscn")

var play_step_sound = false
var play_ground_hit_sound = false

func _ready():
	chase_speed *= boss_speed_modifier
	floor_hit_delay /= boss_speed_modifier
	throw_start_time /= boss_speed_modifier
	throw_miss_time /= boss_speed_modifier
	throwing_time /= boss_speed_modifier
	floor_hit_time /= boss_speed_modifier
	stuck_time /= boss_speed_modifier
	releasing_time /= boss_speed_modifier
	default_chase_speed = chase_speed
	Signals.connect("start_boss", Callable(self, "_start_boss"))
	boss.play_anim("idle", 1)

func _physics_process(delta):
	apply_current_state()
	play_animations()
	play_sounds()
	
	boss.set_velocity(Vector3((move_dir * move_speed), boss.gravity_manager.y_velo, 0))
	boss.set_up_direction(Vector3(0,1,0))
	boss.move_and_slide()
	boss.velocity

func pursuit_player():
	if state == states.CHASING:
		var difference = global_transform.origin.x - player_node.global_transform.origin.x
		if difference > 0:
			chasing_direction = DirectionEnum.LEFT
		elif difference < 0:
			chasing_direction = DirectionEnum.RIGHT
			
func set_state(new_state):
	frame_state_changed = Engine.get_frames_drawn()
	state_changed = true
	state = new_state

func apply_current_state():
	match state:
		states.IDLE:
			move_speed = 0
		states.CHASING:
			set_vulnerability(false)
			move_speed = chase_speed
			if move_dir != chasing_direction:
				move_speed = 0
			move_dir = chasing_direction
			pursuit_player()
			if state_changed:
				shake_on_step_timer()
				chasing_timer(chasing_time)
		states.FLOOR_HIT:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				floor_hit_timer(1.8 / boss_speed_modifier)
				next_state_timer(floor_hit_time, states.STUCK)
		states.STUCK:
			set_vulnerability(true)
			move_speed = 0
			if state_changed:
				next_state_timer(stuck_time, states.RELEASING)
		states.RELEASING:
			set_vulnerability(true)
			move_speed = 0
			if state_changed:
				next_state_timer(releasing_time, states.CHASING)
		states.THROW_START:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				throw_check_timer(throw_start_time)
		states.THROW_MISS:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				next_state_timer(throw_miss_time, states.CHASING)
		states.THREW:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				grabbing = true
				grab_timer(throwing_time - (0.7 / boss_speed_modifier), false)
				next_state_timer(throwing_time, states.CHASING)
			if grabbing:
				player_node.global_transform.origin = claw.global_transform.origin
				
	if state_changed and frame_state_changed != Engine.get_frames_drawn():
		state_changed = false
		frame_state_changed = 0
		
func spawn_hit_ground_effect():
	spawn_next_hit(amount_hit_ground_effect)

func spawn_next_hit(i):
	var effect = hit_ground_effect_preload.instantiate()
	effect.flip = !facing_right
	effect.attack_damage = floor_hit_damage
	effect.distance_modifier = amount_hit_ground_effect - i
	add_child(effect)
	i -= 1
	if i > 0:
		spawn_hit_delay(floor_hit_delay, i)
		
func check_throw_side():
	var body_right = ray_right.get_collider()
	var body_left = ray_left.get_collider()
	var distance_right = 100
	var distance_left = 100
	if !body_right:
		facing_right = true
	else:
		if body_right.name != "Player":
			distance_right = body_right.global_transform.origin.x - global_transform.origin.x
	if !body_left:
		facing_right = false
	else:
		if body_left.name != "Player":
			distance_left = global_transform.origin.x - body_left.global_transform.origin.x
	if distance_right >= distance_left:
		facing_right = true
	else:
		facing_right = false
		
	if move_dir == DirectionEnum.LEFT and facing_right:
		facing_right = !facing_right
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right:
		facing_right = !facing_right
		flip()
		
func set_vulnerability(flag):
	if boss.vulnerable != flag:
		boss.vulnerable = flag

func play_animations():
	if state == states.CHASING:
		if move_dir == DirectionEnum.LEFT and facing_right:
			flip()
		if move_dir == DirectionEnum.RIGHT and !facing_right:
			flip()
		
	match state:
		states.IDLE:
			boss.play_anim("idle")
		states.CHASING:
			boss.play_anim("walk", 1.3 * boss_speed_modifier)
		states.FLOOR_HIT:
			boss.play_anim("punch", 1.4 * boss_speed_modifier)
		states.STUCK:
			boss.play_anim("stun", 1 * boss_speed_modifier)
		states.RELEASING:
			boss.play_anim("recover", 1.5 * boss_speed_modifier)
		states.THROW_START:
			boss.play_anim("throw_start", 1.5 * boss_speed_modifier)
		states.THROW_MISS:
			boss.play_anim("throw_miss", 1.5 * boss_speed_modifier)
		states.THREW:
			boss.play_anim("throw_success", 1.5 * boss_speed_modifier)
			
func play_sounds():
	if play_step_sound:
		play_step_sound = false
		boss.sound_manager.play_grass_step(0, 2)
	if play_ground_hit_sound:
		play_ground_hit_sound = false
		boss.sound_manager.play_attack(10, 1.2)

func flip():
	var degrees = 0
	facing_right = !facing_right
	if !facing_right:
		degrees = 180
	boss.graphics.rotation_degrees.y = degrees
	
func shake_on_step_timer():
	await get_tree().create_timer(1.3/boss_speed_modifier).timeout
	if state == states.CHASING:
		GlobalState.camera.add_trauma(0.3)
		shake_on_step_timer()
		play_step_sound = true
	
func chasing_timer(time):
	await get_tree().create_timer(time).timeout
	if is_player_close():
		set_state(states.THROW_START)
	else:
		set_state(states.FLOOR_HIT)
		
func next_state_timer(time, next_state):
	await get_tree().create_timer(time).timeout
	set_state(next_state)
	
func throw_check_timer(time):
	await get_tree().create_timer(time).timeout
	if is_player_close():
		check_throw_side()
		set_state(states.THREW)
	else:
		set_state(states.THROW_MISS)
	
func grab_timer(time, flag):
	await get_tree().create_timer(time).timeout
	grabbing = flag
	if !flag:
		Signals.emit_signal("damage_player", throw_damage, !facing_right, 2)
	
func spawn_hit_delay(time, iteration):
	await get_tree().create_timer(time).timeout
	spawn_next_hit(iteration)
	
func floor_hit_timer(time):
	await get_tree().create_timer(time).timeout
	GlobalState.camera.add_trauma(0.7)
	play_ground_hit_sound = true
	spawn_hit_ground_effect()
	
func _start_boss(boss_name, _focal_point):
	if boss_name == boss.name:
		set_state(states.CHASING)

func is_player_close():
	var difference = global_transform.origin.x - player_node.global_transform.origin.x
	if difference < 0:
		difference *= -1
	return difference < grab_distance
