extends StaticBody2D
class_name TreeFarm

@onready var item_drop_position = $ItemDropPosition
@onready var tree_with_fruits = $TreeWithFruits
@onready var tree_no_fruits = $TreeNoFruits
@onready var tree_trunk = $TreeTrunk

var current_tree_sprite: Node2D

var tree_health: int

func _ready():
	current_tree_sprite = tree_with_fruits
	tree_health = 5

func cut_tree():
	
	if tree_trunk.visible:
		_shake_tree()
		return
		
	tree_health -= 1
	_drop_fruit()
	_shake_tree()
	

	if tree_health <= 0:
		tree_health = 0
		_drop_woods()
		_switch_sprite_to_tree_trunk()

func interact():
	_drop_fruit()
	_shake_tree()


func _drop_woods():
	var wood_scene = preload("res://scenes/wood.tscn")
	_spawn_drop(wood_scene)


func _drop_fruit():
	if tree_no_fruits.visible:
		return
	var fruit_scene = preload("res://scenes/fruit.tscn")	
	_spawn_drop(fruit_scene)
	_switch_to_no_fruit_tree()


func _shake_tree():
	var tween = get_tree().create_tween()
	tween.tween_property(current_tree_sprite, 'rotation', PI / 12, 0.05)
	tween.tween_property(current_tree_sprite, 'rotation', -PI / 12, 0.05)
	tween.tween_property(current_tree_sprite, 'rotation', 0, 0.05 )

func _spawn_drop(drop_scene: PackedScene):
	var spawn_nodes = item_drop_position.get_children()
	for spawn in spawn_nodes:
		var wood: Node2D = drop_scene.instantiate()
		spawn.add_child(wood)
		

func _switch_to_no_fruit_tree():
	tree_with_fruits.visible = false
	tree_no_fruits.visible = true
	current_tree_sprite = tree_no_fruits

func _switch_sprite_to_tree_trunk():
	tree_with_fruits.visible = false
	tree_no_fruits.visible = false
	tree_trunk.visible = true
	current_tree_sprite = tree_trunk

