extends AnimatedSprite2D

var next_idle_animation = "idle_down"
@onready var playerBody:Player = $".."

var current_rotation = Vector2.DOWN
var _is_animate_action = false

var _is_interacting_tree = false

func _process(_delta):
	_get_player_rotation()	
	
	if Input.is_action_just_pressed("action"):
		_action_animations()
	
	if _is_animate_action == false:
		_movement_animation()
	

func _action_animations():
	if _is_interacting_tree:
		_animate_axe_swing()


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
		_idle_animtaion()
		return
	if current_rotation == Vector2.UP:
		play("walk_up")
	elif current_rotation == Vector2.DOWN:
		play("walk_down")
	elif current_rotation == Vector2.LEFT:
		play("walk_left")
	elif current_rotation == Vector2.RIGHT:
		play("walk_right")

func _idle_animtaion():
	if current_rotation == Vector2.UP:
		play("idle_up")
	elif current_rotation == Vector2.DOWN:
		play("idle_down")
	elif current_rotation == Vector2.RIGHT:
		play("idle_right")
	elif current_rotation == Vector2.LEFT:
		play("idle_left")

func _on_animation_finished():
	_is_animate_action = false

func _on_interact_trigger_body_entered(body):
	if body is TreeFarm:
		_is_interacting_tree = true

func _on_interact_trigger_body_exited(_body):
	_is_interacting_tree = false
