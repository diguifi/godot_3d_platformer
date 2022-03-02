extends Spatial

enum states {
	IDLE,
	CHASING,
	FLOOR_HIT,
	STUCK,
	RELEASING,
	THROWING,
	THREW
}

export var chase_speed = 1.8
export var throw_damage = 2
export var floor_hit_damage = 2
export var floor_hit_delay = 0.4
export var throwing_time = 3.2
export var floor_hit_time = 2.3
export var stuck_time = 3.3
export var releasing_time = 2.2
export var chasing_time = 6
onready var player_node = get_node("/root/World/Player")
onready var boss: KinematicBody = get_parent()
onready var claw = get_parent().get_node("Graphics/Armature/Skeleton/Claw")
onready var ray_right = $RayCastRight
onready var ray_left = $RayCastLeft
var grab_distance = 5
var grabbing = false
var default_chase_speed = 0
var facing_right = true
var on_ledge_or_wall = false
var chasing_direction = 1
var move_dir = DirectionEnum.RIGHT
var move_speed = 1.5
var state = states.IDLE
var state_changed = false
var frame_state_changed = 0
var amount_hit_ground_effect = 4
var hit_ground_effect_preload = preload("res://enemies/bosses/BossPowerEffect.tscn")

func _ready():
	Signals.connect("start_boss", self, "_start_boss")
	default_chase_speed = chase_speed
	boss.play_anim("idle", 1)

func _physics_process(delta):
	check_move_dir()
	apply_current_state()
	play_animations()
	
	boss.move_and_slide(Vector3((move_dir * move_speed), boss.gravity_manager.y_velo, 0), Vector3(0,1,0))
	
func check_move_dir():
	on_ledge_or_wall = false
	if boss.is_on_wall():
		move_dir = -move_dir
		on_ledge_or_wall = true

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
				chasing_timer(chasing_time)
		states.FLOOR_HIT:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				floor_hit_timer(1.8)
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
		states.THROWING:
			set_vulnerability(false)
			move_speed = 0
			if state_changed:
				grab_timer(1, true)
				grab_timer(throwing_time - 0.7, false)
				next_state_timer(throwing_time, states.THREW)
			if grabbing:
				player_node.global_transform.origin = claw.global_transform.origin
		states.THREW:
			set_vulnerability(false)
			if state_changed:
				set_state(states.CHASING)
	if state_changed and frame_state_changed != Engine.get_frames_drawn():
		state_changed = false
		frame_state_changed = 0
		
func spawn_hit_ground_effect():
	spawn_next_hit(amount_hit_ground_effect)

func spawn_next_hit(i):
	var effect = hit_ground_effect_preload.instance()
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
		if move_dir == DirectionEnum.LEFT and facing_right and !on_ledge_or_wall:
			flip()
		if move_dir == DirectionEnum.RIGHT and !facing_right and !on_ledge_or_wall:
			flip()
		
	match state:
		states.CHASING:
			boss.play_anim("walk", 1.2)
		states.FLOOR_HIT:
			boss.play_anim("punch", 1.4)
		states.STUCK:
			boss.play_anim("stun")
		states.RELEASING:
			boss.play_anim("recover", 1.5)
		states.THROWING:
			boss.play_anim("throw", 1)

func flip():
	var degrees = 0
	facing_right = !facing_right
	if !facing_right:
		degrees = 180
	boss.graphics.rotation_degrees.y = degrees
	
func chasing_timer(time):
	yield(get_tree().create_timer(time),"timeout")
	if is_player_close():
		set_state(states.THROWING)
	else:
		set_state(states.FLOOR_HIT)
		
func next_state_timer(time, next_state):
	yield(get_tree().create_timer(time),"timeout")
	set_state(next_state)
	
func grab_timer(time, flag):
	yield(get_tree().create_timer(time),"timeout")
	grabbing = flag
	if !flag:
		Signals.emit_signal("damage_player", throw_damage, !facing_right, 2)
	else:
		check_throw_side()
	
func spawn_hit_delay(time, iteration):
	yield(get_tree().create_timer(time),"timeout")
	spawn_next_hit(iteration)
	
func floor_hit_timer(time):
	yield(get_tree().create_timer(time),"timeout")
	spawn_hit_ground_effect()
	
func _start_boss(boss_name, _focal_point):
	if boss_name == boss.name:
		set_state(states.CHASING)

func is_player_close():
	var difference = global_transform.origin.x - player_node.global_transform.origin.x
	if difference < 0:
		difference *= -1
	return difference < grab_distance
