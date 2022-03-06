extends Camera

onready var player = get_parent().get_node("Player")
export var smooth_speed = 1.5
export var offset: Vector3
export var dialog_zoom_amount = 3
var offset_x = 3

# cutscene variables
var on_cutscene = false
var go_to_next_scene = false
var current_cutscene_step = 0
var current_cutscene_size = 0
var current_step_smooth_speed = 1
var current_cutscene_script = {}
var cutscene_step_translation = Vector3(0,0,0)

# boss variables
var on_boss = false
var boss_focal_point = Vector3(0,0,0)

# camera shake variables
onready var initial_rotation := rotation_degrees as Vector3
export var trauma_reduction_rate := 1.0
export var max_x := 10.0
export var max_y := 10.0
export var max_z := 5.0
export var noise : OpenSimplexNoise
export var noise_speed := 50.0
var trauma := 0.0
var time := 0.0

# godot methods
func _ready():
	Signals.connect("start_boss", self, "_start_boss")
	Signals.connect("kill_boss", self, "_finish_boss")
	GlobalState.camera = self
	set_process(false)

func _physics_process(delta):
	check_and_apply_shake(delta)
	if (player != null):
		var new_offset = offset
		if !on_boss:
			if player.facing_right:
				new_offset.x = offset_x
			else:
				new_offset.x = -offset_x
		else:
			var difference_x = boss_focal_point.x - player.global_transform.origin.x
			var difference_y = boss_focal_point.y - player.global_transform.origin.y
			new_offset.x -= difference_x/2
			new_offset.y -= difference_y/2
			
		if GlobalState.dialog_happening:
			new_offset.z = offset.z - dialog_zoom_amount
			new_offset.x = offset.x
			
		if !on_cutscene and !on_boss:
			translation = lerp(translation, player.translation + new_offset, smooth_speed * delta)
		if on_boss:
			translation = lerp(translation, boss_focal_point + new_offset, smooth_speed * delta)
	if on_cutscene:
		play_cutscene(delta)

# cutscene methods
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
	
# camera shake methods
func check_and_apply_shake(delta):
	if trauma > 0:
		time += delta
		trauma = max(trauma - delta * trauma_reduction_rate, 0.0)
		
		rotation_degrees.x = initial_rotation.x + max_x * get_shake_intensity() * get_noise_from_seed(0)
		rotation_degrees.y = initial_rotation.y + max_y * get_shake_intensity() * get_noise_from_seed(1)
		rotation_degrees.z = initial_rotation.z + max_z * get_shake_intensity() * get_noise_from_seed(2)

func add_trauma(trauma_amount):
	trauma = clamp(trauma + trauma_amount, 0.0, 1.0)

func get_shake_intensity() -> float:
	return trauma * trauma

func get_noise_from_seed(_seed) -> float:
	noise.seed = _seed
	return noise.get_noise_1d(time * noise_speed)

# signals
func _start_boss(boss_name, focal_point):
	on_boss = true
	boss_focal_point = focal_point
	
func _finish_boss():
	on_boss = false
	boss_focal_point = Vector3(0,0,0)
