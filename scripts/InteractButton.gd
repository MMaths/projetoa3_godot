extends TouchScreenButton

func _on_InteractButton_pressed() -> void:
	var _interact = Input.action_press("interact")
	self.visible = false
