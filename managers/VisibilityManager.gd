extends VisibleOnScreenNotifier3D

@onready var parent = get_parent()

func _on_screen_entered():
	var particles = parent.get_node("CPUParticles3D")
	if particles:
		particles.emitting = true
		particles.visible = true


func _on_screen_exited():
	var particles = parent.get_node("CPUParticles3D")
	if particles:
		particles.emitting = false
		particles.visible = false
