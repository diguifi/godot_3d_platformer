extends KinematicBody

onready var gravity_manager = $KinematicGravity
onready var right_floor_ray = $FloorCheckRight
onready var left_floor_ray = $FloorCheckLeft
onready var graphics = $Graphics
export var hp = 10
const DAMAGE_KICK = 10
var damage_timer = 0.5
var damaged = false
var x_axis_damage_kick = 0

func _ready():
	Signals.connect("damage_enemy", self, "_damage_enemy")

func _physics_process(delta):
	transform.origin.z = 0
	if is_on_floor():
		 gravity_manager.y_velo = -0.1
	play_animations()
		
func apply_damage_kick(direction):
	if !damaged:
		damaged = true
		gravity_manager.y_velo = DAMAGE_KICK
		x_axis_damage_kick = DAMAGE_KICK * direction
		damage_time()
		
func play_animations():
	if damaged:
		visible = false if Engine.get_frames_drawn() % 4 == 0 else true
	if !damaged:
		visible = true
		
func damage_time():
	yield(get_tree().create_timer(damage_timer),"timeout")
	damaged = false
	x_axis_damage_kick = 0

func _damage_enemy(damage, on_right):
	hp -= damage
	if hp <= 0:
		queue_free()
	if on_right:
		apply_damage_kick(-1)
	else:
		apply_damage_kick(1)
