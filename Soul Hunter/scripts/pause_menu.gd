extends Control

signal continue_game
signal exit_game

func _on_continue_button_pressed() -> void:
	continue_game.emit()

func _on_exit_button_pressed() -> void:
	exit_game.emit()
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
