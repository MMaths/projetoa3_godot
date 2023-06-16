extends Button

export(String) var scene_path

func _input(event):
	if event.is_action_pressed("back"):
		on_BackButton_pressed()

func on_BackButton_pressed():
	var _change_scene: bool = get_tree().change_scene(scene_path)

func _on_BackButton_mouse_entered():
	modulate.a = 0.5
	
func _on_BackButton_mouse_exited():
	modulate.a = 1.0
