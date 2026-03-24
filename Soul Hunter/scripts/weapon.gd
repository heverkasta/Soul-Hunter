extends Marker2D

@onready var bow: Sprite2D = $Bow


func _physics_process(_delta):
	var attack_direction = Input.get_vector("attack_left", "attack_right", "attack_up", "attack_down").normalized()
	if attack_direction.length() != 0.0:
		rotation = attack_direction.angle()
	
	if attack_direction.x > 0:
		bow.flip_v = false
	elif attack_direction.x < 0:
		bow.flip_v= true
