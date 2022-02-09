extends Camera

onready var player = get_parent().get_node("Player")
export var smooth_speed = 5.0
export var offset: Vector3

func _physics_process(delta):
	if(player != null):
		if player.facing_right:
			offset.x = 2
		else:
			offset.x = -2
		translation = lerp(translation, player.translation + offset, smooth_speed * delta)
