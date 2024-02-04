extends Node3D

var play_cutscene = {
	"0": {
		"position": Vector3(25, 10, 7),
		"speed": 2,
		"duration": 2
	},
	"1": {
		"position": Vector3(-3, 10, 7),
		"speed": 0.6,
		"duration": 1.5
	},
	"2": {
		"position": Vector3(34, 0, 6),
		"speed": 0.7,
		"duration": 1.5
	},
}

@onready var children = get_children()
var valid_children = []

func _ready():
	MusicManager.change_music("Game")
	#GlobalState.camera.start_cutscene(play_cutscene)
	
