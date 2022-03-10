extends Node2D

onready var tween_out = $TweenOut
onready var tween_in = $TweenIn
var transition_duration = 1.00
var transition_type = 1

var music_keys = {
	"Game": "Game",
	"Boss": "Boss",
	"MainMenu": "MainMenu",
	"Lose": "Lose",
}
var currently_playing = ""

func change_music(new_music, with_fade = true, force_play = false):
	if (currently_playing != new_music) || force_play:
		if with_fade:
			fade_out_all_musics()
			fade_in(get_node(new_music))
		else:
			stop_all_musics()
			get_node(new_music).play()
		currently_playing = new_music

func stop_all_musics():
	for music in music_keys.values():
		var musicNode = get_node(music)
		if musicNode.playing:
			musicNode.stop()

func fade_out_all_musics():
	for music in music_keys.values():
		var musicNode = get_node(music)
		if musicNode.playing:
			fade_out(musicNode)

func fade_in(stream_player):
	tween_in.interpolate_property(stream_player, "volume_db", -80, 0, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_in.start()

func fade_out(stream_player):
	tween_out.interpolate_property(stream_player, "volume_db", 0, -80, transition_duration, transition_type, Tween.EASE_IN, 0)
	tween_out.start()

func _on_Tween_tween_completed(object, _key):
	object.stop()
	object.volume_db = 0

func _on_TweenIn_tween_completed(object, _key):
	object.play()
