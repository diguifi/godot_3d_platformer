extends Spatial

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

onready var children = get_children()
var valid_children = []

func _ready():
	MusicManager.change_music("Game")
	GlobalState.camera.start_cutscene(play_cutscene)
	for child in children:
		var is_valid = true
		if !(child is KinematicBody):
			is_valid = false
		if ("Room" in child.name):
			child.visible = false
		if is_valid:
			valid_children.append(child)
	
func _process(delta):
	for child in valid_children:
		if is_instance_valid(child):
			if "dead" in child:
				if !child.dead:
					child.visible = false
			else:
				child.visible = false
