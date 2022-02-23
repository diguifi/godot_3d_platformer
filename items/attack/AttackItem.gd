extends Spatial

onready var player = get_node("/root/World/Player")
onready var attack_area = $AttackArea
export var damage = 1
export(int, 1, 10) var attack_speed = 4.5
const MAX_ATTACK_SPEED = 10
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
	var time_delay = ((MAX_ATTACK_SPEED+1.0)/attack_speed)/MAX_ATTACK_SPEED
	print(time_delay)
	yield(get_tree().create_timer(time_delay),"timeout")
	print("time_delay fin")
	can_attack = true
