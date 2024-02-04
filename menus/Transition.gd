extends CanvasLayer

@onready var animation = $AnimationPlayer
var path = ""

func fade_to(scn_path):
	path = scn_path
	animation.play("Fade")

func change_scene_to():
	print(path)
	if path != "":
		get_tree().change_scene_to_file(path)

