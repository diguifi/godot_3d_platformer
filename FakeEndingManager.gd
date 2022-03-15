extends Area

func _on_Area_body_entered(body):
	if body.name == 'Player':
		Transition.fade_to("res://menus/FakeEnding.tscn")
