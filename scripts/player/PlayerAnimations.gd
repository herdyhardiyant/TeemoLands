extends AnimatedSprite2D

var next_idle_animation = "idle_down"
@onready var playerBody = $".."
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	character_animation()
	
func character_animation():
	if playerBody.velocity.y < 0:
		play("walk_up")	
		next_idle_animation = "idle_up"
	elif playerBody.velocity.y > 0:
		play("walk_down")	
		next_idle_animation = "idle_down"		
	elif playerBody.velocity.x < 0:
		play("walk_left")			
		next_idle_animation = "idle_left"		
	elif playerBody.velocity.x > 0:
		play("walk_right")		
		next_idle_animation = "idle_right"
	else:
		play(next_idle_animation)
