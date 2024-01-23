extends CharacterBody2D

class_name Player

const SPEED = 5000.0

@onready var anim = $AnimatedSprite2D

var next_idle_animation:String

var move_direction = Vector2.ZERO

func _process(_delta):
	character_animation()

func _physics_process(delta: float) -> void:
	var rotation_direction = Input.get_vector("left", "right", "up", "down")
	velocity = rotation_direction * SPEED * delta
	move_and_slide()
	
func character_animation():
	if Input.is_action_pressed("up"):
		anim.play("walk_up")	
		next_idle_animation = "idle_up"
	elif Input.is_action_pressed("down"):
		anim.play("walk_down")	
		next_idle_animation = "idle_down"		
	elif Input.is_action_pressed("left"):
		anim.play("walk_left")			
		next_idle_animation = "idle_left"		
	elif Input.is_action_pressed("right"):
		anim.play("walk_right")		
		next_idle_animation = "idle_right"
	else:
		anim.play(next_idle_animation)
		
		
	
