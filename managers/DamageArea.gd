extends Area

onready var player = get_node("/root/World/Player")
export var damage = 1
var damage_timer = 1
var damaging = false
var left_dmg = true

func _physics_process(delta):
	var distance = 0
	var is_far = false
	if player:
		distance = player.global_transform.origin.x - global_transform.origin.x
		if distance < 0:
			distance = -distance
		if distance > 1.5:
			is_far = true

	if (damaging or !left_dmg) and !is_far:
		cause_damage(player)
		
func cause_damage(body):
	damaging = true
	var difference = global_transform.origin.x - body.global_transform.origin.x
	Signals.emit_signal("damage_player", damage, difference >= 0)

func damage_time():
	yield(get_tree().create_timer(damage_timer),"timeout")
	damaging = false

func _on_DamageArea_body_entered(body):
	if body.name == "Player":
		cause_damage(body)
		left_dmg = false
		damage_time()

func _on_DamageArea_body_exited(body):
	damaging = false
	left_dmg = true
