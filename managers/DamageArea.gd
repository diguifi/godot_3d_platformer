extends Area3D

@onready var player = get_node("/root/World/Player")
@onready var parent = get_parent()
@onready var collision = $CollisionShape3D
@export var damage = 1
var damage_timer = 1
var already_damaged = false

func _physics_process(delta):
	check_player_in_area()
	collision.disabled = parent.dead
		
func check_player_in_area():
	if !already_damaged:
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" and (!parent.dead and !parent.vulnerable):
				cause_damage(player)
		
func cause_damage(body):
	if !already_damaged:
		already_damaged = true
		var difference = global_transform.origin.x - body.global_transform.origin.x
		Signals.emit_signal("damage_player", damage, difference >= 0, 1)
		damage_time()

func damage_time():
	if (get_tree() != null):
		await get_tree().create_timer(damage_timer).timeout
		already_damaged = false

func _on_DamageArea_body_entered(body):
	if !already_damaged:
		if body.name == "Player" and (!parent.dead and !parent.vulnerable):
			cause_damage(body)

func _on_DamageArea_body_exited(body):
	already_damaged = false
