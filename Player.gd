extends CharacterBody2D

class_name Player

const SPEED = 300.0

@onready var anim = $AnimatedSprite2D

func _ready() -> void:
	anim.play("walk_south")	

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.y -= SPEED * delta
	if Input.is_action_pressed("down"):
		position.y += SPEED * delta
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("right"):
		position.x += SPEED * delta
	
	
