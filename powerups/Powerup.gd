extends Spatial

export var power_up = "double_jump"
onready var mesh = $MeshInstance
onready var label = $Sprite3D
onready var timer = $Timer

func _physics_process(delta):
	transform.origin.z = 0

func _on_Area_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("get_power_up", power_up)
		mesh.visible = false
		label.visible = true
		timer.start()


func _on_Timer_timeout():
	queue_free()
