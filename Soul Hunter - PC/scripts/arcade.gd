extends Node2D

@onready var player: CharacterBody2D = %Elise
@onready var wave_label: Label = %wave_label
@onready var score_label: Label = %score_label
@onready var main_hud: Panel = $"hud/main hud"
@onready var gameover_arcade: Control = $hud/gameover_arcade
@onready var pause_menu: Control = $hud/pause_menu




@export var spawn_margin := 200

var active_enemies: Array = []

var enemy_scenes: Dictionary = {
	"easy": preload("res://scenes/easy_slime_(arcade).tscn"),
	"medium": preload("res://scenes/medium_slime_(arcade).tscn"),
	"hard": preload("res://scenes/hard_slime_(arcade).tscn")
}

var curent_wave := 1
var enemies_per_wave := 3
var time_between_enemies := 0.3
var time_between_waves := 1.0
var is_spawning := false

func _ready() -> void:
	spawn_wave()
	wave_label.text = "Onda: %d" % curent_wave
	Global.score_update.connect(update_score_label)
	Global.score = 0
	Global.soul = 0
	score_label.text = "Pontuação: %d" %Global.score

func spawn_enemy():
	var enemy_scene = get_enemy_scene_for_wave(curent_wave)
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.global_position = calculate_spawn_position()
	enemy.player = player
	
	active_enemies.append(enemy)
	enemy.tree_exited.connect(on_enemy_exit.bind(enemy))

func get_enemy_scene_for_wave(wave: int) -> PackedScene:
	if wave <= 2:
		return enemy_scenes["easy"]
	elif wave <= 6:
		return enemy_scenes["medium"]
	else:
		return enemy_scenes["hard"]

func on_enemy_exit(enemy):
	if enemy in active_enemies:
		active_enemies.erase(enemy)
	
	if active_enemies.is_empty():
		next_wave()

func spawn_wave():
	if is_spawning:
		return
	wave_label.text = "Onda: %d" % curent_wave
	
	for i in enemies_per_wave:
		spawn_enemy()
		await get_tree().create_timer(time_between_enemies).timeout

func next_wave():
	if !is_inside_tree():
		await ready
	await get_tree().create_timer(time_between_waves).timeout
	curent_wave += 1
	enemies_per_wave += 2
	is_spawning = false
	spawn_wave()

func calculate_spawn_position() -> Vector2:
	var player_pos = player.global_position
	
	var spawn_distance := spawn_margin
	
	var angle := randf_range(0, TAU)
	var spawn_pos = player_pos + Vector2.RIGHT.rotated(angle) * spawn_distance
	
	return spawn_pos

func update_score_label(score):
	score_label.text = "Pontuação: %d" % Global.score

func game_over():
	get_tree().paused = true
	main_hud.hide()
	gameover_arcade.show()


func _on_elise_player_died() -> void:
	game_over()
	gameover_arcade.set_score_label()

func _on_gameover_arcade_exit_pressed() -> void:
	get_tree().paused = false


func _on_pause_button_pressed() -> void:
	main_hud.hide()
	pause_menu.show()
	get_tree().paused = true


func _on_pause_menu_continue_game() -> void:
	main_hud.show()
	pause_menu.hide()
	get_tree().paused = false


func _on_pause_menu_exit_game() -> void:
	get_tree().paused = false
