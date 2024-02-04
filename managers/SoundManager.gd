extends Node3D

@export var grass_steps_sounds: Array[AudioStream] = []
@export var attack_sounds: Array[AudioStream] = []
@export var damage_sounds: Array[AudioStream] = []
@export var pain_sounds: Array[AudioStream] = []
@onready var attack_sound = $AttackSound
@onready var damage_sound = $DamageSound
@onready var pain_sound = $PainSound
@onready var walk_sound = $WalkSound

func play_pain(volume = 0, speed = 1):
	play_random_sound(pain_sounds, pain_sound, volume, speed)

func play_damage(volume = 0, speed = 1):
	play_random_sound(damage_sounds, damage_sound, volume, speed, true)

func play_attack(volume = 0, speed = 1):
	play_random_sound(attack_sounds, attack_sound, volume, speed, true)

func play_grass_step(volume = 0, speed = 1):
	play_random_sound(grass_steps_sounds, walk_sound, volume, speed)
	
func play_random_sound(array, player, volume, speed, dont_wait = false):
	if array.size() > 0 and (!player.playing or dont_wait):
		var selected_sound = choose(array)
		player.volume_db = volume
		player.pitch_scale = speed
		player.stream = selected_sound
		player.play()
	
func choose(array):
	return array[randi() % array.size()]
