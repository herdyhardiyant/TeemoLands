extends Node2D


@onready var character_player = $/root/World/CharacterPlayer



var is_timeout = false
func _process(_delta):
	if !is_timeout:
		return
	
	var player_position = character_player.global_position
	var tween = get_tree().create_tween()
	tween.tween_property(self,'global_position', player_position, 0.5)
	var dist_to_player = global_position.distance_to(player_position)
	if dist_to_player <= 5.0:
		queue_free()
	
	
	

func _on_timer_timeout():
	is_timeout = true

func _on_area_2d_body_entered(body):
	pass
	#if !is_timeout:
		#return
		#
	#if body is Player:
		#queue_free()
