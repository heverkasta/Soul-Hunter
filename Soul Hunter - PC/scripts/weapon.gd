extends Marker2D

@onready var bow: Sprite2D = $Bow


func _physics_process(_delta):
	var attack_direction = get_global_mouse_position() - global_position
	if attack_direction.length() != 0.0:
		rotation = attack_direction.angle()
	
	if attack_direction.x > 0:
		bow.flip_v = false
	elif attack_direction.x < 0:
		bow.flip_v= true
