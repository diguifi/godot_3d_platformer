extends Position3D

var hit_count_preload = preload("res://managers/HitCount.tscn")

func spawn_hit_count(value):
	var instance = hit_count_preload.instance()
	instance.hit_value = value
	instance.spawner_ref = self
	add_child(instance)
