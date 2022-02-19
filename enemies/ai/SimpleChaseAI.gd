extends Spatial

enum states {
	IDLE,
	PATROLLING,
	CHASING
}

export var view_distance = 10
export var patrol_speed = 1.5
export var chase_speed = 3
onready var front_check = $FrontRayCast
onready var enemy: KinematicBody = get_parent()
var default_chase_speed = 0
var player_ref = null
var facing_right = true
var on_ledge = false
var chasing_direction = 1
var move_dir = DirectionEnum.RIGHT
var move_speed = 1.5
var state = states.PATROLLING

func _ready():
	front_check.cast_to = Vector3( view_distance, 0, 0 )
	default_chase_speed = chase_speed

func _physics_process(delta):
	check_player_visible()
	check_move_dir()
	check_flip()
	apply_current_state()
	
	enemy.move_and_slide(Vector3(move_dir * move_speed, enemy.gravity_manager.y_velo, 0), Vector3(0,1,0))
	
func check_move_dir():
	on_ledge = false
	if enemy.is_on_wall():
		move_dir = -move_dir
	if "right_floor_ray" in enemy:
		if !enemy.right_floor_ray.is_colliding():
			move_dir = DirectionEnum.LEFT
			on_ledge = true
	if "left_floor_ray" in enemy:
		if !enemy.left_floor_ray.is_colliding():
			move_dir = DirectionEnum.RIGHT
			on_ledge = true
	
func check_player_visible():
	var body = front_check.get_collider()
	if body:
		if (body.name == "Player"):
			player_ref = body
			chasing_direction = move_dir
			state = states.CHASING
		else:
			pursuit_player()
	else:
		pursuit_player()

func pursuit_player():
	if state == states.CHASING:
		var difference = global_transform.origin.x - player_ref.global_transform.origin.x
		if difference > 0 and difference < view_distance:
			chasing_direction = DirectionEnum.LEFT
		elif difference < 0 and difference > -view_distance:
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

func check_flip():
	if move_dir == DirectionEnum.LEFT and facing_right and !on_ledge:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right and !on_ledge:
		flip()

func flip():
	var degrees = 0
	facing_right = !facing_right
	if !facing_right:
		degrees = 180
	rotation_degrees.y = degrees
