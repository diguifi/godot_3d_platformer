extends Spatial

onready var camera = get_parent().get_node("Camera")
onready var sprite = $AnimatedSprite3D
var starting_z = 0
var starting_distance_z = 0

func _ready():
	starting_z = global_transform.origin.z
	if camera:
		starting_distance_z = starting_z - camera.transform.origin.z

func _process(delta):
	if camera:
		global_transform.origin = camera.transform.origin
		global_transform.origin.z =  starting_distance_z + camera.transform.origin.z

func fit_background():
	var viewportWidth = get_viewport().size.x
	var frame = sprite.frames.get_frame("default", 0)
	var new_scale = viewportWidth / (frame.get_size().x / (-starting_z/7))
	sprite.pixel_size = 0.01 * new_scale
