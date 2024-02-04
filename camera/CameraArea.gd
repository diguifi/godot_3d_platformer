extends Area3D

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		body.visible = true
