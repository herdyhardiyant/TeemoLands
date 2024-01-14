extends CharacterBody2D

class_name Player

const SPEED = 300.0

@onready var anim = $AnimatedSprite2D

var nextIdle:String

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		anim.play("walk_up")
		position.y -= SPEED * delta
		nextIdle = "idle_up"
	elif Input.is_action_pressed("down"):
		position.y += SPEED * delta
		anim.play("walk_down")
		nextIdle = "idle_down"		
	elif Input.is_action_pressed("left"):
		position.x -= SPEED * delta
		anim.play("walk_left")
		nextIdle = "idle_left"		
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
		anim.play("walk_right")
		nextIdle = "idle_right"
	else:
		anim.play(nextIdle)
	
		
	
