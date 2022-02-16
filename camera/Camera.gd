extends Camera

onready var player = get_parent().get_node("Player")
export var smooth_speed = 5.0
export var offset: Vector3
var offset_x = 4

func _physics_process(delta):
	if(player != null):
		if player.facing_right:
			offset.x = offset_x
		else:
			offset.x = -offset_x
		translation = lerp(translation, player.translation + offset, smooth_speed * delta)
