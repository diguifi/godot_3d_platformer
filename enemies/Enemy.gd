extends KinematicBody

onready var gravity_manager = $KinematicGravity
onready var right_floor_ray = $FloorCheckRight
onready var left_floor_ray = $FloorCheckLeft
onready var collision = $CollisionShape
onready var graphics = $Graphics
onready var anim_player = $Graphics/AnimationPlayer
onready var health_bar = $HealthBar3D
onready var hit_count_spawner = $HitCountSpawner
onready var sound_manager = $SoundManager
export var hp = 10
var max_hp = 10
const DAMAGE_KICK = 10
var damage_timer = 0.5
var damaged = false
var x_axis_damage_kick = 0
var dead = false
var vulnerable = false
var play_damage_sound = false
var flies = false

func _ready():
	Signals.connect("damage_enemy", self, "_damage_enemy")
	max_hp = hp
	if !gravity_manager:
		flies = true

func _physics_process(delta):
	transform.origin.z = 0
	if is_on_floor() and !flies:
		 gravity_manager.y_velo = -0.1
	play_animations()
	play_sounds()
		
func apply_damage_kick(direction):
	if !damaged:
		if !flies:
			gravity_manager.y_velo = DAMAGE_KICK
		damaged = true
		x_axis_damage_kick = DAMAGE_KICK * direction
		damage_time(damage_timer)
		
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
		
func play_sounds():
	if play_damage_sound:
		play_damage_sound = false
		sound_manager.play_damage(5)
		
func die():
	collision.disabled = true
	dead = true
	play_anim("Die")
	wait_before_free(1.5)
		
func damage_time(time):
	yield(get_tree().create_timer(time),"timeout")
	damaged = false
	x_axis_damage_kick = 0
	
func wait_before_free(time):
	yield(get_tree().create_timer(time),"timeout")
	queue_free()

func _damage_enemy(unique_name, damage, on_right):
	if unique_name == name:
		GlobalState.camera.add_trauma(0.3)
		hp -= damage
		play_damage_sound = true
		if is_instance_valid(hit_count_spawner):
			hit_count_spawner.spawn_hit_count(damage)
		if is_instance_valid(health_bar):
			health_bar.update_healthbar(hp, max_hp)
		if hp <= 0:
			die()
		if on_right:
			apply_damage_kick(-1)
		else:
			apply_damage_kick(1)
