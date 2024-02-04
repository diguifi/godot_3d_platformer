extends Area3D

@export var boss_gate_spawns: Array[NodePath] = []
@export var boss_path: NodePath
@export var boss_focal_point_path: NodePath
var boss_gate = preload("res://enemies/bosses/BossGate.tscn")
var player_on_area = false
	
func start_boss_fight():
	player_on_area = true
	close_gates()
	awake_boss()
	
func close_gates():
	for spawn in boss_gate_spawns:
		var node = get_node(spawn)
		var gate = boss_gate.instantiate()
		gate.global_transform = node.global_transform
		get_node("/root/World").add_child(gate)
		
func awake_boss():
	if boss_path:
		var boss = get_node(boss_path)
		var focal = get_node(boss_focal_point_path)
		Signals.emit_signal("start_boss", boss.name, focal.global_transform.origin)

func _on_BossArea_body_entered(body):
	if body.name == "Player":
		if !player_on_area:
			start_boss_fight()
