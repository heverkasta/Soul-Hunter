extends CharacterBody2D

@onready var move_joystick: Control = %"Move Joystick".get_node("base")
@onready var attack_joystick: Control = %"Attack Joystick".get_node("base")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

@export var speed := 150.0

func _physics_process(_delta: float):
	var direction = move_joystick.get_direction()
	velocity = direction * speed
	move_and_slide()
	
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true
	
	if velocity.length() == 0.0:
		animation.play("idle")
	else:
		animation.play("run")
