extends Spatial

onready var label = $CanvasLayer/Control/Label
onready var control = $CanvasLayer/Control

func _ready():
	Signals.connect("show_dialog", self, "_show_dialog")
	Signals.connect("hide_dialog", self, "_hide_dialog")
	
func _process(delta):
	if !GlobalState.on_dialog_area:
		control.visible = false

func _show_dialog(dialog, is_last):
	if !control.visible:
		control.visible = true
	label.text = dialog.text.en
	
func _hide_dialog():
	control.visible = false

func _on_NextButton_pressed():
	Signals.emit_signal("next_step_dialog")
