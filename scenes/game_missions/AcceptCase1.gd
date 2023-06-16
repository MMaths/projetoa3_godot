extends Button

onready var selected_case: int = 0

func _on_AcceptCase1_pressed():
	if selected_case != 1:
		selected_case = 1
		disabled = true
