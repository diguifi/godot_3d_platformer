extends Node3D

@onready var animation = $AnimationPlayer
@onready var label = $CanvasLayer/Label
var rng = RandomNumberGenerator.new()
var hit_value = 0
var spawner_ref = null
var gravity_effect_strength = 3
var gravity = 50
var max_y_velo = 0
var starting_x = 0
var y_velo = -0.5
var x_velo = 0
var falling = false

func _ready():
	if !GlobalState.show_hit_amount:
		visible = false
		queue_free()
	animation.play("default")
	label.text = str(hit_value)
	rng.randomize()
	x_velo = rng.randi_range(-20, 20)
	starting_x = -x_velo
	rng.randomize()
	max_y_velo = rng.randi_range(-5, -2)
	set_label_pos()
	
func _physics_process(delta):
	if (y_velo > max_y_velo) and !falling:
		y_velo -= gravity * delta
	elif (y_velo > max_y_velo - 2) and !falling:
		y_velo = lerpf(y_velo, max_y_velo - 4.0, 0.1)
	else:
		falling = true
		y_velo += gravity * delta
	
	x_velo = lerpf(x_velo, 0.0, 0.1)
	set_label_pos()
	
func set_label_pos():
	var viewport_position = GlobalState.camera.unproject_position(spawner_ref.global_transform.origin)
	label.global_position.x = viewport_position.x + ((x_velo + starting_x) * gravity_effect_strength)
	label.global_position.y = viewport_position.y + (y_velo * gravity_effect_strength)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
