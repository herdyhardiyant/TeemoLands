extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_update_interact_position()
		
func _update_interact_position():
	var input_rotation = Input.get_vector("left", "right", "up", "down")
	if input_rotation == Vector2.ZERO:
		return
	position = input_rotation * 14

