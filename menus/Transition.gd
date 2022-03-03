extends CanvasLayer

onready var animation = $AnimationPlayer
var path = ""

func fade_to(scn_path):
	self.path = scn_path
	animation.play("Fade")

func change_scene():
	print(path)
	if path != "":
		get_tree().change_scene(path)

