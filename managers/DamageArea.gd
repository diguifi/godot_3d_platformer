extends Area

export var damage = 1

func _on_DamageArea_body_entered(body):
	if body.name == "Player":
		var difference = global_transform.origin.x - body.global_transform.origin.x
		Signals.emit_signal("damage_player", damage, difference >= 0)
