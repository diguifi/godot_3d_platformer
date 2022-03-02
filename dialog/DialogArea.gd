extends Spatial

export var dialog_path = ""
var parsed_dialog = null
var total_steps = 0
var current_step = 0

func _ready():
	Signals.connect("next_step_dialog", self, "_next_step_dialog")
	parsed_dialog = load_dialogue(dialog_path)
	total_steps = parsed_dialog.size()

func _process(delta):
	if GlobalState.on_dialog_area and Input.is_action_just_pressed("attack"):
		GlobalState.dialog_happening = true
		_next_step_dialog()
		
func load_dialogue(file_path):
	var file = File.new()
	assert(file.file_exists(file_path))

	file.open(file_path, file.READ)
	var json_result = JSON.parse(file.get_as_text())
	var dialog = json_result.result
	assert(dialog.size() > 0)
	return dialog

func _next_step_dialog():
	if current_step >= total_steps:
		GlobalState.dialog_happening = false
		Signals.emit_signal("hide_dialog")
		current_step = 0
	else:
		GlobalState.dialog_happening = true
		var last_dialog = current_step == total_steps - 1
		Signals.emit_signal("show_dialog", parsed_dialog[String(current_step)], last_dialog)
		current_step += 1

func _on_Area_body_entered(body):
	if body.name == "Player":
		GlobalState.on_dialog_area = true

func _on_Area_body_exited(body):
	if body.name == "Player":
		GlobalState.on_dialog_area = false
		current_step = 0
		GlobalState.dialog_happening = false
