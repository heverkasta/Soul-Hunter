extends CharacterBody2D

@onready var move_joystick: Control = %"Move Joystick".get_node("base")
@onready var attack_joystick: Control = %"Attack Joystick".get_node("base")
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var weapon_pivot: Marker2D = $weaponPivot.get_node("Bow/shootingPoint")
@onready var player_healthbar: ProgressBar = %player_healthbar
@onready var soul_bar: ProgressBar = %soul_bar

@export var bullet_scene : PackedScene

@export var speed := 60.0
@export var damage : int = 1
@export var can_shoot : bool = true
@export var shooting_cooldown : float = 1.0
@export var max_health : int = 25
@export var max_soulbar : int = 10
var current_soulbar : int = 0
var current_health : int = max_health

var knokback_velocity : Vector2 = Vector2.ZERO
var knokback_decay : float = speed * 8

signal player_died

func _ready() -> void:
	Global.player = self
	Global.soul_update.connect(update_soul_level)
	player_healthbar.max_value = max_health
	soul_bar.max_value = max_soulbar
	current_health = max_health
	current_soulbar = 0

func _physics_process(delta: float) -> void:
	var attack_direction = attack_joystick.get_direction()
	var move_direction = move_joystick.get_direction()
	if knokback_velocity.length() > 1 :
		velocity = knokback_velocity
		move_and_slide()
		knokback_velocity = knokback_velocity.move_toward(Vector2.ZERO, knokback_decay * delta)
	else:
		velocity = move_direction * speed
		move_and_slide()
	
	if attack_direction.length() > 0.2 and can_shoot:
		shoot(attack_direction)
	
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

func update_soul_level(soul):
	if Global.soul < 10:
		current_soulbar = Global.soul
		max_soulbar = 10
	elif Global.soul < 23:
		current_soulbar = Global.soul - 10
		max_soulbar = 13
	elif Global.soul < 36:
		current_soulbar = Global.soul - 23
		max_soulbar = 13
	elif Global.soul < 50:
		current_soulbar = Global.soul - 36
		max_soulbar = 14
	else:
		current_soulbar = 14
		max_soulbar = 14
	
	soul_bar.max_value = max_soulbar
	soul_bar.value = current_soulbar
	
	if Global.soul >= 10:
		speed = 65
		damage = 2
		shooting_cooldown = 0.875
	elif Global.soul >= 23:
		speed = 70
		damage = 4
		shooting_cooldown = 0.750
	elif Global.soul >= 36:
		speed = 75
		damage = 6
		shooting_cooldown = 0.625
	elif Global.soul >= 50:
		speed = 80
		damage = 8
		shooting_cooldown = 0.5
	
	print("global soul: %d" %Global.soul)
	print("current soul bar: %d" %current_soulbar)

func take_damage(amount: int, source_position: Vector2):
	current_health -= amount
	current_health = clamp(current_health, 0, max_health)
	player_healthbar.value = current_health
	
	var knokback_dir = (position - source_position).normalized()
	apply_knokback(knokback_dir * speed * 3)

func apply_knokback(force: Vector2):
	knokback_velocity = force

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		if (current_health-body.damage) > 0:
			take_damage(body.damage, body.global_position)
		else:
			current_health = 0
			player_died.emit()
