extends Area2D

var interacted_object
@onready var player = $".."


func _ready():
	position.y = 14

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_update_interact_position()

func _update_interact_position():
	var velocity: Vector2 = player.velocity
	var input_rotation: Vector2 = velocity.normalized()
	if input_rotation == Vector2.ZERO:
		return
	position = input_rotation * 14

func _on_hand_button_pressed():
	_interact_the_object()

func _interact_the_object():
	if interacted_object == null:
		return
	if interacted_object is TreeFarm:
		interacted_object.interact()


func _on_area_entered(area: Area2D) -> void:
	interacted_object = area.get_parent()

func _on_area_exited(_area: Area2D) -> void:
	interacted_object = null

func _on_animated_sprite_2d_on_action_finish() -> void:
	if interacted_object == null:
		return
	if interacted_object is TreeFarm:
		interacted_object.cut_tree()
