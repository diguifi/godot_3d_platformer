extends TextureProgress

onready var animation = $AnimationPlayer
var bar_red = preload("res://assets/img/barHorizontal_red.png")
var bar_green = preload("res://assets/img/barHorizontal_green.png")
var bar_yellow = preload("res://assets/img/barHorizontal_yellow.png")

func _ready():
	tint_progress.a = 0.0
	

func update_healthbar(amount, full):
	max_value = full
	texture_progress = bar_green
	if amount < 0.7 * full:
		texture_progress = bar_yellow
	if amount < 0.25 * full:
		texture_progress = bar_red
	if amount < max_value:
		tint_progress.a = 255.0
		animation.stop(true)
		animation.play("default")
	value = amount
