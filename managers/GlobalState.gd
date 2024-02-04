extends Node

var is_player_alive = true
var on_dialog_area = false
var dialog_happening = false
var camera = null
var show_health_bars = true
var show_hit_amount = true
var music_volume = 0.5
var sfx_volume = 1
var already_watched_intro = false
var checkpoint_save = {
	has_saved = false,
	checkpoint_x = 0,
	checkpoint_y = 0,
	player = {
		has_double_jump = false
	}
}

func _ready():
	_update_configs()

func _update_configs():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear_to_db(music_volume))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), linear_to_db(sfx_volume))

func set_checkpoint(x, y, player):
	checkpoint_save.has_saved = true
	checkpoint_save.checkpoint_x = x
	checkpoint_save.checkpoint_y = y
	checkpoint_save.player.has_double_jump = player.has_double_jump
