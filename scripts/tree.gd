extends StaticBody2D
class_name TreeFarm

@onready var fruits_position = $FruitsPosition
@onready var tree_with_fruits = $TreeWithFruits
@onready var tree_no_fruits = $TreeNoFruits

func interact():
	_drop_fruit()

func _drop_fruit():
	if tree_no_fruits.visible:
		return
	var spawn_nodes = fruits_position.get_children()
	var fruit_scene = preload("res://scenes/fruit.tscn")	
	for spawn in spawn_nodes:
		var fruit = fruit_scene.instantiate()
		spawn.add_child(fruit)
	_switch_tree()
	

func _switch_tree():
	tree_with_fruits.visible = !tree_with_fruits.visible
	tree_no_fruits.visible = !tree_no_fruits.visible
