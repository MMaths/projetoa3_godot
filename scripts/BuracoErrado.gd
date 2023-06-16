extends StaticBody2D

signal body_entered

func _on_InteractableArea_body_entered(body):
	if body is Bola:
		emit_signal("body_entered")
