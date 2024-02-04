extends Node3D

@export var power_up = "double_jump"
@export var player_ref: NodePath = ""
@onready var mesh = $MeshInstance3D
@onready var label = $Sprite3D
@onready var timer = $Timer
@onready var audio = $AudioStreamPlayer3D
var going_up = true
var initial_y = 0

func _ready():
	initial_y = global_transform.origin.y
	if player_ref:
		var has_double = get_node(player_ref).has_double_jump
		if has_double:
			queue_free()

func _physics_process(delta):
	transform.origin.z = 0
	if !label.visible:
		if going_up:
			global_transform.origin.y += delta
			if global_transform.origin.y >= initial_y + 0.4:
				going_up = false
		else:
			global_transform.origin.y -= delta
			if global_transform.origin.y <= initial_y:
				going_up = true

func _on_Area_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("get_power_up", power_up)
		mesh.visible = false
		label.visible = true
		audio.stop()
		timer.start()


func _on_Timer_timeout():
	queue_free()
