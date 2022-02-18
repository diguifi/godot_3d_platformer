extends KinematicBody

onready var gravity_manager = $KinematicGravity
export var hp = 10
const MOVE_SPEED = 2
var move_dir = -1

func _physics_process(delta):
	transform.origin.z = 0
	if is_on_floor():
		 gravity_manager.y_velo = -0.1
	if is_on_wall():
		move_dir = -move_dir
		
	move_and_slide(Vector3(move_dir * MOVE_SPEED, gravity_manager.y_velo, 0), Vector3(0,1,0))
