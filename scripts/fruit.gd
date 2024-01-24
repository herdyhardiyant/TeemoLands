extends Node2D

var is_ready_to_pickup = false
func _on_area_2d_body_entered(body):
	if !is_ready_to_pickup:
		return
	if "Player" in body.name:
		print("Player gets the fruit")
		queue_free()


func _on_timer_timeout():
	is_ready_to_pickup = true
