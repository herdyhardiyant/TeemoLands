extends StaticBody2D
class_name TreeFarm

@onready var fruits_position = $FruitsPosition
@onready var tree_with_fruits = $TreeWithFruits
@onready var tree_no_fruits = $TreeNoFruits

var current_sprite: Node2D

func _ready():
	current_sprite = tree_with_fruits

# TODO
# Add tree health
# if player use axe to the tree:
	# Tree shakes
	# drop fruits
	# Reduce tree health
# if Health == 0:
	# Drop woods
	# Change tree sprite

func cut_tree():
	_drop_fruit()
	_shake_tree()
	
	

func _shake_tree():
	var tween = get_tree().create_tween()
	tween.tween_property(current_sprite, 'rotation', PI / 12, 0.05)
	tween.tween_property(current_sprite, 'rotation', -PI / 12, 0.05)
	tween.tween_property(current_sprite, 'rotation', 0, 0.05 )
	


func interact():
	_drop_fruit()
	_shake_tree()

func _drop_fruit():
	if tree_no_fruits.visible:
		return
	var spawn_nodes = fruits_position.get_children()
	var fruit_scene = preload("res://scenes/fruit.tscn")	
	for spawn in spawn_nodes:
		var fruit = fruit_scene.instantiate()
		spawn.add_child(fruit)
	_switch_to_no_fruit_tree()
	

func _switch_to_no_fruit_tree():
	tree_with_fruits.visible = !tree_with_fruits.visible
	tree_no_fruits.visible = !tree_no_fruits.visible
	current_sprite = tree_no_fruits
