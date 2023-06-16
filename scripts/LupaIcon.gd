extends Area2D
class_name Icon

onready var lupa := $Lupa as AnimatedSprite
onready var interact_button: TouchScreenButton = get_parent().get_node("HUD/InteractButton")

func _on_InteractableObject_body_entered(body):
	if body.is_in_group("InteractableObject"):
		lupa.visible = true
		interact_button.visible = true
		

func _on_InteractableObject_body_exited(body):
	if body.is_in_group("InteractableObject"):
		lupa.visible = false
		interact_button.visible = false
