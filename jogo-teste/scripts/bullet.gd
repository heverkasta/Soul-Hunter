extends Area2D

@export var speed : float = 300.0
var direction : = Vector2.ZERO

func _process(delta):
	position += direction * speed * delta

func set_direction(new_direction):
	direction = new_direction.normalized()
	rotation = direction.angle()
