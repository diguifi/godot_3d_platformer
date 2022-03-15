extends Spatial

export var power_up = "double_jump"
onready var mesh = $MeshInstance
onready var label = $Sprite3D
onready var timer = $Timer
onready var audio = $AudioStreamPlayer3D
var going_up = true
var initial_y = 0

func _ready():
	initial_y = global_transform.origin.y

func _physics_process(delta):
	transform.origin.z = 0
	if !label.visible:
		if going_up:
			global_transform.origin.y += delta
			if global_transform.origin.y >= initial_y + 0.4:
				going_up = false
		else:
			global_transform.origin.y -= delta
			if global_transform.origin.y <= initial_y:
				going_up = true

func _on_Area_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("get_power_up", power_up)
		mesh.visible = false
		label.visible = true
		audio.stop()
		timer.start()


func _on_Timer_timeout():
	queue_free()
