extends Node2D

var transition_duration = 1.00
var transition_type = 1
var stream_player_local

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
	var tween_in = get_tree().create_tween()
	stream_player_local = stream_player
	tween_in.tween_property(stream_player, "volume_db", 0, transition_duration)
	tween_in.tween_callback(_on_TweenIn_completed)

func fade_out(stream_player):
	var tween_out = get_tree().create_tween()
	stream_player_local = stream_player
	tween_out.tween_property(stream_player, "volume_db", -80, transition_duration)
	tween_out.tween_callback(_on_TweenOut_completed)

func _on_TweenOut_completed():
	stream_player_local.stop()
	stream_player_local.volume_db = 0

func _on_TweenIn_completed():
	stream_player_local.play()
