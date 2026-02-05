extends Control

func _ready() -> void:
	if Global.username:
		$aviso.visible = false
		$alert.visible = false

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")

func _on_arcade_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/arcade.tscn")

func _on_account_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/account_screen.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
