extends CharacterBody2D

class_name Player

const SPEED = 5000.0

@onready var anim = $AnimatedSprite2D

var next_idle_animation:String

var move_direction = Vector2.ZERO

func _process(delta):
	character_movement()

func _physics_process(delta: float) -> void:
	velocity = move_direction * SPEED * delta
	move_and_slide()
	move_direction = Vector2.ZERO
	
func character_movement():
	var walk_animation:String 
	if Input.is_action_pressed("up"):
		walk_animation = "walk_up"
		move_direction.y = -1
		next_idle_animation = "idle_up"
	if Input.is_action_pressed("down"):
		move_direction.y = 1
		walk_animation = "walk_down"
		next_idle_animation = "idle_down"		
	if Input.is_action_pressed("left"):
		move_direction.x = -1
		walk_animation = "walk_left"		
		next_idle_animation = "idle_left"		
	if Input.is_action_pressed("right"):
		move_direction.x = 1
		walk_animation = "walk_right"		
		next_idle_animation = "idle_right"
	
	move_direction.normalized()
	
	if move_direction == Vector2.ZERO:
		anim.play(next_idle_animation)
	else:
		anim.play(walk_animation)
		
	
