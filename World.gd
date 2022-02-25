extends Spatial

var play_cutscene = {
	"0": {
		"position": Vector3(25, 10, 7),
		"speed": 2,
		"duration": 1
	},
	"1": {
		"position": Vector3(-5, 10, 7),
		"speed": 0.6,
		"duration": 1
	},
	"2": {
		"position": Vector3(35, 0, 7),
		"speed": 0.7,
		"duration": 1
	},
}

func _ready():
	GlobalState.camera.start_cutscene(play_cutscene)
