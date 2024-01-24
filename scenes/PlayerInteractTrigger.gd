extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_interact_position()
		
func update_interact_position():
	var input_rotation = Input.get_vector("left", "right", "up", "down")
	if input_rotation == Vector2.ZERO:
		return
	position = input_rotation * 14

func _on_body_entered(body):
	print("Overlap detected with: ", body.name)
