extends CharacterBody2D

@onready var move_joystick: Control = %"Move Joystick".get_node("base")
@onready var attack_joystick: Control = %"Attack Joystick".get_node("base")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var weapon_pivot: Marker2D = $weaponPivot.get_node("Bow/shootingPoint")

@export var bullet_scene : PackedScene

@export var speed := 50.0

var can_shoot : bool = true
@export var shooting_cooldown : float = 2.0

func _physics_process(_delta: float) -> void:
	var attack_direction = attack_joystick.get_direction()
	var move_direction = move_joystick.get_direction()
	velocity = move_direction * speed
	move_and_slide()
	
	if attack_direction.x > 0:
		animation.flip_h = false
	elif attack_direction.x < 0:
		animation.flip_h = true
	
	if velocity.length() == 0.0:
		animation.play("idle")
	elif velocity.length() != 0.0:
		if animation.flip_h == false and move_direction.x < 0.0:
			animation.play_backwards("run")
		elif animation.flip_h == true and move_direction.x > 0.0:
			animation.play_backwards("run")
		else:
			animation.play("run")
	
	if attack_direction.length() > 0.2 and can_shoot:
		shoot(attack_direction)

func shoot(direction):
	can_shoot = false
	var bullet_instance = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet_instance)
	bullet_instance.global_position = weapon_pivot.global_position
	bullet_instance.set_direction(direction)
	await get_tree().create_timer(shooting_cooldown).timeout
	can_shoot = true
