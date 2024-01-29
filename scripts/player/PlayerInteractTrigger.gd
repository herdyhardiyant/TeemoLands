extends Area2D

var interacted_object

func _ready():
	position.y = 14
	position.y = 0	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_update_interact_position()
	_interact_the_object()

func _interact_the_object():
	if interacted_object == null:
		return
	if Input.is_action_just_pressed("action"):
		if interacted_object is TreeFarm:
			interacted_object.interact()

func _update_interact_position():
	var input_rotation = Input.get_vector("left", "right", "up", "down")
	if input_rotation == Vector2.ZERO:
		return
	position = input_rotation * 14

func _on_body_entered(body):
	interacted_object = body

func _on_body_exited(_body):
	interacted_object = null
