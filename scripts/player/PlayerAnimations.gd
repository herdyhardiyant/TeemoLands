extends AnimatedSprite2D

var next_idle_animation = "idle_down"
@onready var playerBody = $".."

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
	if Input.is_action_pressed("up"):
		current_rotation = Vector2.UP
	elif Input.is_action_pressed("down"):
		current_rotation = Vector2.DOWN	
	elif Input.is_action_pressed("left"):
		current_rotation = Vector2.LEFT
	elif Input.is_action_pressed("right"):
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
	if Input.is_action_pressed("up"):
		play("walk_up")	
	elif Input.is_action_pressed("down"):
		play("walk_down")	
	elif Input.is_action_pressed("left"):
		play("walk_left")			
	elif Input.is_action_pressed("right"):
		play("walk_right")		
	else:
		_idle_animtaion()


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

func _on_interact_trigger_body_exited(body):
	_is_interacting_tree = false
