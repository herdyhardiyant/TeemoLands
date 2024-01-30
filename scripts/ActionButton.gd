extends Button

@onready var button_normal = $"../ButtonNormal"
@onready var pressed_button = $"../ButtonPressed"


func _ready():
	pressed_button.visible = false
	button_normal.visible = true

func _on_button_down():
	pressed_button.visible = true
	button_normal.visible = false

func _on_button_up():
	pressed_button.visible = false
	button_normal.visible = true
