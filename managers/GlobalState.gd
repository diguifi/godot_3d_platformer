extends Node

var is_player_alive = true
var on_dialog_area = false
var dialog_happening = false
var camera = null
var show_health_bars = false
var show_hit_amount = true
var music_volume = 0.5
var sfx_volume = 1

func _ready():
	_update_configs()

func _update_configs():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(music_volume))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear2db(sfx_volume))
