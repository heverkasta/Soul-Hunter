extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var elise: CharacterBody2D = %Elise

@export var speed : float = 30.0
@export var heath : int = 5

var knokback_velocity : Vector2 = Vector2.ZERO
var knokback_decay : float = speed * 8

var direction : Vector2 = Vector2.ZERO
var player = null

func _ready() -> void:
	player = Global.player

func _physics_process(delta):
	if knokback_velocity.length() > 1 :
		animation.play("damage")
		velocity = knokback_velocity
		move_and_slide()
		knokback_velocity = knokback_velocity.move_toward(Vector2.ZERO, knokback_decay * delta)
	else:
		animation.play("walk")
		if player:
			direction = global_position.direction_to(player.global_position)
			velocity = direction * speed
		move_and_slide()
	
	if direction.x > 0:
		animation.flip_h = false
	elif direction.x < 0:
		animation.flip_h = true

func apply_knokback(force: Vector2):
	knokback_velocity = force

func take_damage(amount: int, source_position: Vector2):
	heath -= amount
	var knokback_dir = (global_position - source_position).normalized()
	apply_knokback(knokback_dir * speed * 3)
	if heath <= 0:
		queue_free()
	print("enemy heath is:" + str(heath))
