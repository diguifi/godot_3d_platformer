extends Camera

onready var player = get_parent().get_node("Player")
export var smooth_speed = 2.0
export var offset: Vector3
export var dialog_zoom_amount = 3
var offset_x = 5

var on_cutscene = false
var go_to_next_scene = false
var current_cutscene_step = 0
var current_cutscene_size = 0
var current_step_smooth_speed = 1
var current_cutscene_script = {}
var cutscene_step_translation = Vector3(0,0,0)

func _ready():
	GlobalState.camera = self
	set_process(false)

func _physics_process(delta):
	if(player != null):
		var new_offset = offset
		if player.facing_right:
			new_offset.x = offset_x
		else:
			new_offset.x = -offset_x
			
		if GlobalState.dialog_happening:
			new_offset.z = offset.z - dialog_zoom_amount
			new_offset.x = offset.x
			
		if !on_cutscene:
			translation = lerp(translation, player.translation + new_offset, smooth_speed * delta)
	
	if on_cutscene:
		play_cutscene(delta)
		
func play_cutscene(delta):
	if go_to_next_scene:
		go_to_next_scene = false
		current_cutscene_step += 1
		if current_cutscene_step < current_cutscene_size:
			cutscene_step_translation = current_cutscene_script[String(current_cutscene_step)].position
			current_step_smooth_speed = current_cutscene_script[String(current_cutscene_step)].speed
			cutscene_time(current_cutscene_script[String(current_cutscene_step)].duration)
		else:
			finish_cutscene()
	translation = lerp(translation, cutscene_step_translation, current_step_smooth_speed * delta)
		
func start_cutscene(script):
	if !on_cutscene:
		current_cutscene_script = script
		current_cutscene_step = -1
		current_cutscene_size = current_cutscene_script.size()
		go_to_next_scene = true
		on_cutscene = true
		
func finish_cutscene():
	on_cutscene = false
	go_to_next_scene = false
	current_cutscene_step = 0
	current_cutscene_size = 0
	current_step_smooth_speed = 1
	current_cutscene_script = {}
	cutscene_step_translation = Vector3(0,0,0)
		
func cutscene_time(time):
	yield(get_tree().create_timer(time),"timeout")
	go_to_next_scene = true
