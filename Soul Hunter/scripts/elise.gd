extends CharacterBody2D

@onready var move_joystick: Control = %"Move Joystick".get_node("base")
@onready var attack_joystick: Control = %"Attack Joystick".get_node("base")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

@export var speed := 50.0

func _physics_process(_delta: float):
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
	else:
		if move_direction.x > 0:
			if animation.flip_h == false:
				animation.play("run")
			else:
				animation.play_backwards("run")
		elif move_direction.x < 0:
			if animation.flip_h == true:
				animation.play("run")
			else:
				animation.play_backwards("run")
