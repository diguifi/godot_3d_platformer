extends Spatial

export var damage = 1
export var attack_speed = 1
var can_attack

func _process(delta):
	transform.basis.z.angle_to(Vector3.DOWN)
