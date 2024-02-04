extends Sprite3D

@onready var bar = $SubViewport/HealthBar

func _ready():
	texture = $SubViewport.get_texture()
	if !GlobalState.show_health_bars and get_parent().name != 'Player':
		queue_free()

func update_healthbar(amount, full):
	bar.update_healthbar(amount, full)
