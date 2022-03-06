extends Sprite3D

onready var bar = $Viewport/HealthBar

func _ready():
	texture = $Viewport.get_texture()
	if !GlobalState.show_health_bars:
		queue_free()

func update_healthbar(amount, full):
	bar.update_healthbar(amount, full)
