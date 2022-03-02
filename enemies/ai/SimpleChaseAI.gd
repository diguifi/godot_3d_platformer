extends Spatial

enum states {
	IDLE,
	PATROLLING,
	CHASING
}

export var view_distance = 10
export var chasing_view_distance_modifier = 1.2
export var patrol_speed = 1.5
export var chase_speed = 3
onready var player_node = get_node("/root/World/Player")
onready var front_check = $FrontRayCast
onready var rear_check = $RearRayCast
onready var enemy: KinematicBody = get_parent()
var y_check_speed = 20
var y_max_range_check = 8
var range_check_going_up = true
var current_y_check = 0
var default_chase_speed = 0
var player_ref = null
var facing_right = true
var on_ledge_or_wall = false
var chasing_direction = 1
var move_dir = DirectionEnum.RIGHT
var move_speed = 1.5
var state = states.PATROLLING

func _ready():
	front_check.cast_to = Vector3( view_distance, 0, 0 )
	rear_check.cast_to = Vector3( -(view_distance * 0.4), 0, 0 )
	default_chase_speed = chase_speed

func _physics_process(delta):
	if !enemy.dead:
		update_y_range_check(delta)
		check_player_visible()
		check_move_dir()
		apply_current_state()
		play_animations()
	
		enemy.move_and_slide(Vector3((move_dir * move_speed) + enemy.x_axis_damage_kick, enemy.gravity_manager.y_velo, 0), Vector3(0,1,0))
	
func check_move_dir():
	on_ledge_or_wall = false
	if enemy.is_on_wall():
		move_dir = -move_dir
		on_ledge_or_wall = true
	if "right_floor_ray" in enemy:
		if !enemy.right_floor_ray.is_colliding():
			move_dir = DirectionEnum.LEFT
			on_ledge_or_wall = true
	if "left_floor_ray" in enemy:
		if !enemy.left_floor_ray.is_colliding():
			move_dir = DirectionEnum.RIGHT
			on_ledge_or_wall = true

func update_y_range_check(delta):
	var new_factor = delta * y_check_speed
	if range_check_going_up:
		current_y_check += 2
		front_check.cast_to = Vector3( view_distance, current_y_check, 0 )
		if current_y_check >= y_max_range_check:
			range_check_going_up = false
	else:
		current_y_check -= new_factor
		front_check.cast_to = Vector3( view_distance, current_y_check, 0 )
		if current_y_check <= 0:
			range_check_going_up = true

func check_player_visible():
	var player = null
	var player_direction = 1
	if enemy.damaged:
		player = player_node
	else:
		var body_front = front_check.get_collider()
		var body_back = rear_check.get_collider()
		if body_front:
			if body_front.name == "Player":
				player = body_front
		elif body_back:
			if body_back.name == "Player":
				player_direction = -1
				player = body_back

	if player and state != states.CHASING:
		player_ref = player
		chasing_direction = move_dir * player_direction
		state = states.CHASING
	elif state == states.CHASING:
		pursuit_player()

func pursuit_player():
	if state == states.CHASING:
		var difference = global_transform.origin.x - player_ref.global_transform.origin.x
		if difference > 0 and difference < (view_distance * chasing_view_distance_modifier):
			chasing_direction = DirectionEnum.LEFT
		elif difference < 0 and difference > (-view_distance * chasing_view_distance_modifier):
			chasing_direction = DirectionEnum.RIGHT
		else:
			player_ref = null
			state = states.PATROLLING

func apply_current_state():
	match state:
		states.PATROLLING:
			move_speed = patrol_speed
		states.CHASING:
			move_speed = chase_speed
			if move_dir != chasing_direction:
				move_speed = 0
			move_dir = chasing_direction

func play_animations():
	if move_dir == DirectionEnum.LEFT and facing_right and !on_ledge_or_wall:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right and !on_ledge_or_wall:
		flip()
		
	if enemy.damaged:
		enemy.play_anim("hit", 1.1)
	elif states.PATROLLING:
		enemy.play_anim("walk")
	elif states.CHASING:
		enemy.play_anim("walk", 1.5)

func flip():
	var degrees = 0
	facing_right = !facing_right
	if !facing_right:
		degrees = 180
	rotation_degrees.y = degrees
	enemy.graphics.rotation_degrees.y = degrees
