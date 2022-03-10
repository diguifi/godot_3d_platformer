extends VisibilityNotifier

onready var parent = get_parent()

func _on_VisibilityManager_camera_entered(_camera):
	parent.visible = true
	var particles = parent.get_node("CPUParticles")
	if particles:
		particles.emitting = true

func _on_VisibilityManager_camera_exited(_camera):
	parent.visible = false
	var particles = parent.get_node("CPUParticles")
	if particles:
		particles.emitting = false
