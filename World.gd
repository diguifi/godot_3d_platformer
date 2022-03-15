extends Spatial

var play_cutscene = {
	"0": {
		"position": Vector3(25, 10, 7),
		"speed": 2,
		"duration": 2.5
	},
	"1": {
		"position": Vector3(-3, 10, 7),
		"speed": 0.6,
		"duration": 2
	},
	"2": {
		"position": Vector3(35, 0, 7),
		"speed": 0.7,
		"duration": 3
	},
}

onready var test_ligh = $DirectionalLightTests
onready var children = get_children()
var valid_children = []

func _ready():
	MusicManager.change_music("Game")
	GlobalState.camera.start_cutscene(play_cutscene)
	if test_ligh:
		test_ligh.visible = false
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
