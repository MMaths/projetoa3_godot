extends Control

signal back_pressed

var go_back = false

func _on_CasesBackButton_pressed():
	go_back = true
	emit_signal("back_pressed", go_back)
