extends Marker2D

@onready var bow: Sprite2D = $Bow
@onready var attack_joystick: Control = $"../../CanvasLayer/Attack Joystick".get_node("base")

func _physics_process(_delta):
	var attack_direction = attack_joystick.get_direction().normalized()
	if attack_direction.length() != 0.0:
		rotation = attack_direction.angle()
	
	if attack_direction.x > 0:
		bow.flip_v = false
	elif attack_direction.x < 0:
		bow.flip_v= true
