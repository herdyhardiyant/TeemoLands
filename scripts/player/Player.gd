extends CharacterBody2D

class_name Player

const SPEED = 5000.0

@onready var anim = $AnimatedSprite2D
@onready var interact_trigger = $InteractTrigger

var next_idle_animation:String
var move_direction = Vector2.ZERO

func _physics_process(delta: float) -> void:
	var rotation_direction = Input.get_vector("left", "right", "up", "down")
	velocity = rotation_direction * SPEED * delta
	move_and_slide()
