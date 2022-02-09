extends KinematicBody

onready var anim_player = $Graphics/AnimationPlayer
const WALK_SPEED = 5
const SPRINT_SPEED = 7
const JUMP_FORCE = 12
const GRAVITY = 24
const MAX_FALL_SPEED = 40
var y_velo = 0
var facing_right = true
var falling = false
 
func _physics_process(delta):
	transform.origin.z = 0
	var grounded = is_on_floor()
	var move_dir = apply_movement()
	var just_jumped = apply_jump(grounded, delta)
	check_fall()
	play_animations(just_jumped, grounded, move_dir)
 
func flip():
	$Graphics.rotation_degrees.y *= -1
	facing_right = !facing_right
 
func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)

func apply_movement():
	var move_dir = DirectionEnum.IDLE
	var movement_modifier = WALK_SPEED
	if Input.is_action_pressed("move_right"):
		move_dir = DirectionEnum.RIGHT
	if Input.is_action_pressed("move_left"):
		move_dir = DirectionEnum.LEFT
	if Input.is_action_pressed("sprint"):
		movement_modifier = SPRINT_SPEED
	move_and_slide(Vector3(move_dir * movement_modifier, y_velo, 0), Vector3(0,1,0))
	return move_dir
	
func apply_jump(grounded, delta):
	var just_jumped = false
	y_velo -= GRAVITY * delta
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = JUMP_FORCE
			just_jumped = true
	else:
		if Input.is_action_just_released("jump") and y_velo > 0:
			falling = true
	return just_jumped
	
func check_fall():
	if falling:
		if y_velo > 0:
			y_velo = lerp(y_velo, 0, 0.15)
		else:
			falling = false

func play_animations(just_jumped, grounded, move_dir):
	if move_dir == DirectionEnum.LEFT and facing_right:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right:
		flip()

	if just_jumped:
		play_anim("jump")
	elif grounded:
		if move_dir == DirectionEnum.IDLE:
			play_anim("idle")
		else:
			play_anim("walk")
