extends Control

func _ready():
	MusicManager.change_music("Game")

func _on_PlayBtn_pressed():
	Transition.fade_to("res://World.tscn")

func _on_QuitBtn_pressed():
	get_tree().quit()
