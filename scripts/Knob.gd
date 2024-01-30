extends Sprite2D

class_name Knob

@onready var parent = $".."
var max_length = 20
var is_pressing = false
var dead_zone = 0.3


func get_axis() -> Vector2:
	if !is_pressing:
		return Vector2.ZERO
	var parent_global_position: Vector2 = parent.global_position

	var axis:Vector2 = parent_global_position.direction_to(global_position).normalized()
	if abs(axis.x) < dead_zone:
		axis.x = 0
	if abs(axis.y) < dead_zone:
		axis.y = 0
	return axis
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_axis()
	if is_pressing:
		_move_knob_to_mouse()
	else:
		_reset_knob_position(delta)



func _move_knob_to_mouse():
	if get_global_mouse_position().distance_to(parent.global_position) <= max_length:
		global_position = get_global_mouse_position()
	else:
		var angle = parent.global_position.angle_to_point(get_global_mouse_position())
		global_position.x = parent.global_position.x + cos(angle) * max_length
		global_position.y = parent.global_position.y + sin(angle) * max_length

func _reset_knob_position(delta):
	global_position = lerp(global_position, parent.global_position, 5 * delta)
	


func _on_button_button_down():
	is_pressing = true


func _on_button_button_up():
	is_pressing = false
