class_name PlayerCharacterAnimation

extends AnimatedSprite2D
var next_idle_animation = "idle_down"

@onready var playerBody:Player = $".."

var current_rotation = Vector2.DOWN

var _is_animate_action = false

#TODO Create signal that active when animate axe swing is finish
signal on_action_finish

func _process(_delta):
	_get_player_rotation()
	if _is_animate_action == false:
		_movement_animation()
	

func _get_player_rotation():
	if playerBody.velocity.y < 0:
		current_rotation = Vector2.UP
	elif playerBody.velocity.y > 0:
		current_rotation = Vector2.DOWN	
	elif playerBody.velocity.x < 0:
		current_rotation = Vector2.LEFT
	elif playerBody.velocity.x > 0:
		current_rotation = Vector2.RIGHT

func _animate_axe_swing():
	_is_animate_action = true
	if current_rotation == Vector2.UP:
		play("axe_up")
	elif current_rotation == Vector2.DOWN:
		play("axe_down")
	elif current_rotation == Vector2.RIGHT:
		play("axe_right")
	elif current_rotation == Vector2.LEFT:
		play("axe_left")


func _movement_animation():
	if !playerBody.is_moving:
		_idle_animation()
		return
	if current_rotation == Vector2.UP:
		play("walk_up")
	elif current_rotation == Vector2.DOWN:
		play("walk_down")
	elif current_rotation == Vector2.LEFT:
		play("walk_left")
	elif current_rotation == Vector2.RIGHT:
		play("walk_right")

func _idle_animation():
	if current_rotation == Vector2.UP:
		play("idle_up")
	elif current_rotation == Vector2.DOWN:
		play("idle_down")
	elif current_rotation == Vector2.RIGHT:
		play("idle_right")
	elif current_rotation == Vector2.LEFT:
		play("idle_left")

func _animate_hoe_swing():
	_is_animate_action = true
	if current_rotation == Vector2.UP:
		play("hoe_up")
	elif current_rotation == Vector2.DOWN:
		play("hoe_down")
	elif current_rotation == Vector2.RIGHT:
		play("hoe_right")
	elif current_rotation == Vector2.LEFT:
		play("hoe_left")
		
func _animate_watering():
	_is_animate_action = true
	if current_rotation == Vector2.UP:
		play("watering_up")
	elif current_rotation == Vector2.DOWN:
		play("watering_down")
	elif current_rotation == Vector2.RIGHT:
		play("watering_right")
	elif current_rotation == Vector2.LEFT:
		play("watering_left")

func _on_animation_finished():
	_is_animate_action = false

func _on_axe_button_down():
	_animate_axe_swing()

func _on_hoe_button_down():
	_animate_hoe_swing()

func _on_watering_button_down():
	_animate_watering()

func _on_frame_changed() -> void:
	if "axe" in animation:
		on_action_finish.emit()
