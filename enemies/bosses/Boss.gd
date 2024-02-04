extends CharacterBody3D

@onready var gravity_manager = $KinematicGravity
@onready var graphics = $Graphics
@onready var anim_player = $Graphics/AnimationPlayer
@onready var health_bar = $HealthBar3D
@onready var right_foot = $Graphics/Armature/Skeleton3D/RightFoot/RayCast3D
@onready var left_foot = $Graphics/Armature/Skeleton3D/LeftFoot/RayCast3D
@onready var hit_count_spawner = $HitCountSpawner
@onready var sound_manager = $SoundManager
@export var hp = 60
var max_hp = 60
var damage_timer = 0.5
var damaged = false
var x_axis_damage_kick = 0
var dead = false
var vulnerable = false
var play_damage_sound = false

func _ready():
	Signals.connect("damage_enemy", Callable(self, "_damage_enemy"))
	max_hp = hp

func _physics_process(delta):
	transform.origin.z = 0
	if is_on_floor():
		gravity_manager.y_velo = -0.1
	play_animations()
	play_sounds()
		
func apply_damage_effect():
	if !damaged:
		damaged = true
		damage_time()
		
func play_anim(anim, speed = 1):
	if anim_player:
		if anim_player.current_animation == anim and anim_player.get_playing_speed() == speed:
			return
		anim_player.set_speed_scale(speed)
		anim_player.play(anim)
		
func play_animations():
	if damaged:
		visible = false if Engine.get_frames_drawn() % 4 == 0 else true
	if !damaged:
		visible = true
#	if dead:
#		anim_player.play()
		
func play_sounds():
	if play_damage_sound:
		play_damage_sound = false
		sound_manager.play_damage(5,0.5)
		
func damage_time():
	await get_tree().create_timer(damage_timer).timeout
	damaged = false
	
func queue_free_time():
	await get_tree().create_timer(damage_timer).timeout
	queue_free()

func _damage_enemy(unique_name, damage, _direction):
	if unique_name == name and vulnerable:
		GlobalState.camera.add_trauma(0.3)
		hp -= damage
		play_damage_sound = true
		if is_instance_valid(hit_count_spawner):
			hit_count_spawner.spawn_hit_count(damage)
		if is_instance_valid(health_bar):
			health_bar.update_healthbar(hp, max_hp)
		if hp <= 0:
			dead = true
			Signals.emit_signal("kill_boss")
			queue_free()
		apply_damage_effect()
	if !vulnerable:
		hit_count_spawner.spawn_hit_count(0)
