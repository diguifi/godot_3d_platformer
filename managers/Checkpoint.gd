extends Spatial

onready var sprite = $Sprite3D
var current_checkpoint = false
var sprite_current_checkpoint = preload("res://assets/img/campfire_lit.png")


func _on_Area_body_entered(body):
	if body.name == "Player":
		current_checkpoint = true
		sprite.texture = sprite_current_checkpoint
		GlobalState.set_checkpoint(global_transform.origin.x, global_transform.origin.y, body)
