extends Node3D

@onready var animated_sprite = $AnimatedSprite3D
@onready var attack_area = $AttackArea
var attack_damage = 0
var flip = false

func _ready():
	attack_area.attack_damage = attack_damage
	if flip:
		animated_sprite.flip_h = true
		transform.origin.x *= -1
	animated_sprite.play("default")

func _on_animated_sprite_3d_animation_finished():
	queue_free()
