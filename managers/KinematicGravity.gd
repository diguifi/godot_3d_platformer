extends Node3D

@onready var parent = get_parent()
@export var automatic_fall = true
@export var GRAVITY = 24
@export var MAX_FALL_SPEED = 70
@export var FALL_MULTIPLIER = 1.5
var gravity_multiplier = 1
var y_velo = -0.15

func _physics_process(delta):
	transform.origin.z = 0
	y_velo -= GRAVITY * delta * gravity_multiplier
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if automatic_fall:
		check_fall()

func check_fall():
	var falling = y_velo < 0
	if falling:
		gravity_multiplier = FALL_MULTIPLIER
	else:
		gravity_multiplier = 1
