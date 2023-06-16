extends Control

const BuildingScn = preload("res://scenes/Escritório.tscn")

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("Button"):
		button.connect("pressed", self, "on_button_pressed", [button])
		button.connect("mouse_exited", self, "mouse_interaction", [button, "exited"])
		button.connect("mouse_entered", self, "mouse_interaction", [button, "entered"])
		
		
func on_button_pressed(button: Button) -> void:
	match button.name:
		"Play":
			TransitionScreen.fade_in("res://scenes/Escritório.tscn")
		"Controls":
			var _controls: bool = get_tree().change_scene("res://scenes/menu_screens/Controls.tscn")
		"Credits":
			var _credits: bool = get_tree().change_scene("res://scenes/menu_screens/Credits.tscn")
		"Quit":
			get_tree().quit()
			
			
func mouse_interaction(button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
		"entered":
			button.modulate.a = 0.5
