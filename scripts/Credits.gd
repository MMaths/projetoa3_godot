extends Button

export(String) var scene_path

func _on_Link_pressed():
	var _link1: bool = OS.shell_open("https://kamisama887.itch.io/lorenz-fries-school-horror")
	var _link2: bool = OS.shell_open("https://szadiart.itch.io/rpg-worlds-houses-and-interiors")
	
func _on_Link_mouse_entered():
	modulate.a = 0.5

func _on_Link_mouse_exited():
	modulate.a = 1.0
