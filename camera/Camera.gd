extends Camera

onready var player = get_parent().get_node("Player")
export var smooth_speed = 2.0
export var offset: Vector3
export var dialog_zoom_amount = 3
var offset_x = 5

func _physics_process(delta):
	if(player != null):
		var new_offset = offset
		if player.facing_right:
			new_offset.x = offset_x
		else:
			new_offset.x = -offset_x
			
		if GlobalState.dialog_happening:
			new_offset.z = offset.z - dialog_zoom_amount
			new_offset.x = offset.x
			
		translation = lerp(translation, player.translation + new_offset, smooth_speed * delta)
