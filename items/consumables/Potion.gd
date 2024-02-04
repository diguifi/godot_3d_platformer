extends Node3D

@onready var gulp_sound = $AudioStreamPlayer3D
@onready var collision = $Area3D/CollisionShape3D
@export var hp_given = 5
var going_up = true
var initial_y = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_y = global_transform.origin.y


func _physics_process(delta):
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
		body.heal_player(hp_given)
		gulp_sound.play()
		collision.disabled = true
		visible = false

func _on_AudioStreamPlayer3D_finished():
	queue_free()
