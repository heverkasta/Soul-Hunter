extends Control

func _ready() -> void:
	%username.text = Global.username

func _on_send_pressed() -> void:
	var text = %username.text
	if text.length() >= 3:
		Global.username = %username.text
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
