extends Area

export var attack_damage = 1

func _on_AttackArea_body_entered(body):
	if body.name == "Player":
		var difference = global_transform.origin.x - body.global_transform.origin.x
		Signals.emit_signal("damage_enemy", attack_damage, difference >= 0)
