extends KinematicBody

onready var gravity_manager = $KinematicGravity
onready var right_floor_ray = $FloorCheckRight
onready var left_floor_ray = $FloorCheckLeft
onready var graphics = $Graphics
export var hp = 10

func _physics_process(delta):
	transform.origin.z = 0
	if is_on_floor():
		 gravity_manager.y_velo = -0.1
