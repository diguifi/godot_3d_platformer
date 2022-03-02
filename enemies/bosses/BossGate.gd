extends Spatial

var amount_to_move = 3
var speed = 4.5
var initial_y = 0
var closed = false
var boss_killed = false

func _ready():
	Signals.connect("kill_boss", self, "_kill_boss")
	initial_y = global_transform.origin.y

func _physics_process(delta):
	if !closed:
		if global_transform.origin.y > initial_y - amount_to_move:
			global_transform.origin.y -= delta * speed
		else:
			closed = true
	elif boss_killed:
		if global_transform.origin.y < initial_y + amount_to_move:
			global_transform.origin.y += delta * speed
		else:
			queue_free()

func _kill_boss():
	boss_killed = true
