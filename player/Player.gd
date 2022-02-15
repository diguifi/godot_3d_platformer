extends KinematicBody

enum JUMP_STATE {
	GROUNDED,
	JUMP,
	DOUBLE_JUMP
}

export var has_double_jump = false
onready var anim_player = $Graphics/AnimationPlayer
const WALK_SPEED = 5
const SPRINT_SPEED = 7
const JUMP_FORCE = 12
const D_JUMP_FORCE = 8
const GRAVITY = 24
const MAX_FALL_SPEED = 40
var y_velo = 0
var facing_right = true
var falling = false
var just_jumped = false
var walk_speed = 1.3
var jump_state = JUMP_STATE.GROUNDED

func _ready():
	Signals.connect("get_power_up", self, "_get_power_up")
 
func _physics_process(delta):
	transform.origin.z = 0
	var grounded = is_on_floor()
	if grounded:
		falling = false
		jump_state = JUMP_STATE.GROUNDED

	var move_dir = apply_movement()
	apply_jump(grounded, delta)
	apply_double_jump(delta)
	check_fall()
	play_animations(grounded, move_dir)
 
func flip():
	$Graphics.rotation_degrees.y *= -1
	facing_right = !facing_right
 
func play_anim(anim, speed = 1):
	if anim_player.current_animation == anim and anim_player.get_playing_speed() == speed:
		return
	anim_player.set_speed_scale(speed)
	anim_player.play(anim)

func apply_movement():
	walk_speed = 1.3
	var move_dir = DirectionEnum.IDLE
	var movement_modifier = WALK_SPEED
	if Input.is_action_pressed("move_right"):
		move_dir = DirectionEnum.RIGHT
	if Input.is_action_pressed("move_left"):
		move_dir = DirectionEnum.LEFT
	if Input.is_action_pressed("sprint"):
		walk_speed = 2
		movement_modifier = SPRINT_SPEED
	move_and_slide(Vector3(move_dir * movement_modifier, y_velo, 0), Vector3(0,1,0))
	return move_dir
	
func apply_jump(grounded, delta):
	just_jumped = false
	y_velo -= GRAVITY * delta
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	if grounded:
		y_velo = -0.1
		if Input.is_action_pressed("jump"):
			y_velo = JUMP_FORCE
			just_jumped = true
			jump_state = JUMP_STATE.JUMP
	else:
		if Input.is_action_just_released("jump"):
			falling = true

func apply_double_jump(delta):
	if Input.is_action_pressed("jump"):
		if jump_state == JUMP_STATE.JUMP and has_double_jump and falling:
			y_velo = D_JUMP_FORCE
			just_jumped = true
			jump_state = JUMP_STATE.DOUBLE_JUMP
			falling = false
	
func check_fall():
	if falling:
		if y_velo > 0:
			y_velo = lerp(y_velo, 0, 0.15)

func play_animations(grounded, move_dir):
	if move_dir == DirectionEnum.LEFT and facing_right:
		flip()
	if move_dir == DirectionEnum.RIGHT and !facing_right:
		flip()

	if just_jumped:
		play_anim("jump", 1.2)
	elif grounded:
		if move_dir == DirectionEnum.IDLE:
			play_anim("idle")
		else:
			play_anim("walk", walk_speed)

func _get_power_up(power):
	if power == "double_jump":
		has_double_jump = true
	
