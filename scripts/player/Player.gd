extends CharacterBody2D

class_name Player

const SPEED = 5000.0

@onready var anim = $AnimatedSprite2D
@onready var interact_trigger = $InteractTrigger
@onready var joystick: Knob = $Camera2D/Joystick/Knob

var move_direction = Vector2.ZERO
var is_moving = false

func _physics_process(delta: float) -> void:
	#var rotation_direction = Input.get_vector("left", "right", "up", "down")
	var rotation_direction = joystick.get_axis()
	if rotation_direction == Vector2.ZERO:
		is_moving = false
	else:
		velocity = rotation_direction * SPEED * delta
		move_and_slide()
		is_moving = true
	

