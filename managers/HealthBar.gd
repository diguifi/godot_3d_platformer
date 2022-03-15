extends TextureProgress

onready var animation = $AnimationPlayer
export var persistent_visibility = false
export var max_alpha = 255.0
var bar_red = preload("res://assets/img/hp_red.png")
var bar_green = preload("res://assets/img/hp_green.png")
var bar_yellow = preload("res://assets/img/hp_yellow.png")

func _ready():
	if !persistent_visibility:
		tint_progress.a = 0.0
	else:
		tint_progress.a = max_alpha


func update_healthbar(amount, full):
	max_value = full
	texture_progress = bar_green
	if amount < 0.7 * full:
		texture_progress = bar_yellow
	if amount < 0.25 * full:
		texture_progress = bar_red
	if amount < max_value:
		tint_progress.a = max_alpha
		if !persistent_visibility:
			animation.stop(true)
			animation.play("default")
	value = amount
