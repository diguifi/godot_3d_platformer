extends Spatial

onready var camera = $Camera
var play_cutscene = {
	"0": {
		"position": Vector3(0, 2.8, -10),
		"speed": 0.1,
		"duration": 10
	}
}

func _on_PlayBtn_pressed():
	camera.start_cutscene(play_cutscene)
	wait_time(1)

func wait_time(time):
	yield(get_tree().create_timer(time),"timeout")
	Transition.fade_to("res://World.tscn")
