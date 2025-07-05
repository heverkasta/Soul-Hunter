extends CharacterBody2D

@export var speed := 100.0
@export var bullet_scene : PackedScene
@export var shoot_cooldown := 0.3

@onready var attack_joystick: Control = %attack_joystick.get_node("base")
@onready var move_joystick: Control = %move_joystick.get_node("base")

var can_shoot : bool = true

func _process(_delta: float) -> void:
	var move_direction = move_joystick.get_direction()
	velocity = move_direction * speed
	
	move_and_slide()
	
	var attack_direction = attack_joystick.get_direction()
	
	if attack_direction.length() > 0.2 and can_shoot:
		shoot(attack_direction)

func shoot(direction):
	can_shoot = false
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.set_direction(direction)
	
	await get_tree().create_timer(shoot_cooldown).timeout
	can_shoot = true
