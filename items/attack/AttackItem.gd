extends Spatial

onready var player = get_node("/root/World/Player")
onready var attack_area = $AttackArea
export var damage = 1
export var attack_speed = 1
var can_attack = true
var slash_effect = preload("res://items/attack/SlashEffect.tscn")

func _process(delta):
	transform.basis.z.angle_to(Vector3.DOWN)
	check_combat_moves()
	
func check_combat_moves():
	if Input.is_action_just_pressed("attack") and can_attack:
		attack()
		
func attack():
	can_attack = false
	var attack_effect = slash_effect.instance()
	attack_effect.flip = !player.facing_right
	attack_effect.attack_damage = damage
	player.add_child(attack_effect)
	attack_time()
	
func attack_time():
	yield(get_tree().create_timer(attack_speed),"timeout")
	can_attack = true
