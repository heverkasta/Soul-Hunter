extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var elise: CharacterBody2D = %Elise

@export var speed := 5.0

func _physics_process(_delta):
	var direction = global_position.direction_to(elise.global_position)
	velocity = direction * speed
	move_and_slide()
	
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true
