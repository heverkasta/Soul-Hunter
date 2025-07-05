extends TextureRect

@export var radius : float = 100.0
var direction : Vector2 = Vector2.ZERO
var touch_id : int = -1
@onready var stick: TextureRect = $stick

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_reset_stick()
	
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed and touch_id == -1 and get_global_rect().has_point(event.position):
			touch_id = event.index
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			direction = Vector2.ZERO
			_reset_stick()
	elif event is InputEventScreenDrag and event.index == touch_id:
		var center = global_position + size/2
		var relative = event.position - center
		
		if relative.length() > radius:
			relative = relative.normalized() * radius
			
		direction = relative.normalized()
		stick.position = (size / 2) - (stick.size / 2) + relative


func _reset_stick():
	stick.position = (size / 2) - (stick.size / 2)

func get_direction() -> Vector2:
	return direction
