extends VisibilityNotifier

onready var parent = get_parent()

func _on_VisibilityManager_camera_entered(camera):
	parent.visible = true

func _on_VisibilityManager_camera_exited(camera):
	parent.visible = false
