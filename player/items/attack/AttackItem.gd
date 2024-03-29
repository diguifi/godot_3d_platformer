extends Node3D

@onready var player = get_node("/root/World/Player")
@export var damage = 1
@export var attack_speed = 4.5 # (int, 1, 10)
const MAX_ATTACK_SPEED = 10
var can_attack = true
var slash_effect = preload("res://player/items/attack/SlashEffect.tscn")

func _process(delta):
	transform.basis.z.angle_to(Vector3.DOWN)
	check_combat_moves()
	
func check_combat_moves():
	if Input.is_action_just_pressed("attack") and can_attack and !GlobalState.on_dialog_area:
		attack()
		
func attack():
	player.attack(1)
	can_attack = false
	var attack_effect = slash_effect.instantiate()
	attack_effect.flip = !player.facing_right
	attack_effect.attack_damage = damage
	player.add_child(attack_effect)
	attack_time()
	
func attack_time():
	var time_delay = ((MAX_ATTACK_SPEED+1.0)/attack_speed)/MAX_ATTACK_SPEED
	await get_tree().create_timer(time_delay).timeout
	can_attack = true
