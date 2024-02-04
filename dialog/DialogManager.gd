extends Node3D

@onready var label = $CanvasLayer/Control/Label
@onready var control = $CanvasLayer/Control
var is_pt = false

func _ready():
	Signals.connect("show_dialog", Callable(self, "_show_dialog"))
	Signals.connect("hide_dialog", Callable(self, "_hide_dialog"))
	is_pt = OS.get_locale() == 'pt' || OS.get_locale() == 'pt_BR' || OS.get_locale() == 'pt-BR'
	
func _process(delta):
	if !GlobalState.on_dialog_area:
		control.visible = false

func _show_dialog(dialog, is_last):
	if !control.visible:
		control.visible = true
	if is_pt:
		label.text = dialog.text.pt
	else:
		label.text = dialog.text.en
	
func _hide_dialog():
	control.visible = false

func _on_NextButton_pressed():
	Signals.emit_signal("next_step_dialog")
