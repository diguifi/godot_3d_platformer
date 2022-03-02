extends Spatial

onready var sprite = $Sprite3D
var attack_damage = 1
var flip = false
var distance_modifier = 1
var dead = false
var vulnerable = false

func _ready():
	var flip_modifier = 1
	if flip:
		flip_modifier = -1
		rotation_degrees.y = 180
	global_transform.origin.x += (distance_modifier * 8.5) * flip_modifier
	visible = true
	spawn_time()

func spawn_time():
	yield(get_tree().create_timer(0.7),"timeout")
	queue_free()
