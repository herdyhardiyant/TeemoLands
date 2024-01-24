extends AnimatedSprite2D

var next_idle_animation = "idle_down"
@onready var playerBody = $".."
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	_character_animation()
	
func _character_animation():
	if Input.is_action_pressed("up"):
		play("walk_up")	
		next_idle_animation = "idle_up"
	elif Input.is_action_pressed("down"):
		play("walk_down")	
		next_idle_animation = "idle_down"		
	elif Input.is_action_pressed("left"):
		play("walk_left")			
		next_idle_animation = "idle_left"		
	elif Input.is_action_pressed("right"):
		play("walk_right")		
		next_idle_animation = "idle_right"
	else:
		play(next_idle_animation)


		
