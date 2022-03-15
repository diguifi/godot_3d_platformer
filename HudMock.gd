extends CanvasLayer

onready var health_bar = $HudItems/HealthBar

func _ready():
	Signals.connect("update_hud", self, "_update_hud")

func _update_hud(hp, max_hp):
	health_bar.update_healthbar(hp, max_hp)
