extends Area2D

@export var speed : float = 60.0
var direction := Vector2.ZERO

func _process(delta : float) -> void:
	position += direction * speed * delta

func set_direction(new_direction):
	direction = new_direction.normalized()
	rotation = direction.angle()

func _on_visibility_screen_exited() -> void:
	queue_free()
