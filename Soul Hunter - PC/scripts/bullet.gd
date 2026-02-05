extends Area2D

@export var speed : float = 100.0
var direction := Vector2.ZERO


func _process(delta : float) -> void:
	position += direction * speed * delta

func set_direction(new_direction):
	direction = new_direction.normalized()
	rotation = direction.angle()

func _on_visibility_screen_exited() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.take_damage(Global.player.damage, global_position)
		self.queue_free()
	elif body.is_in_group("collision"):
		self.queue_free()
