extends Control

func _ready() -> void:
	%username.text = Global.username

func _on_send_pressed() -> void:
	var text = %username.text
	if text.length() >= 2:
		Global.username = %username.text
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")



func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_username_editing_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
