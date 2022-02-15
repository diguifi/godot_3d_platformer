extends Spatial

onready var camera = get_parent().get_node("Camera")
var starting_z = 0

func _ready():
	starting_z = global_transform.origin.z

func _process(delta):
	if camera:
		global_transform.origin = camera.transform.origin
		global_transform.origin.z = starting_z
