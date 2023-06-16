extends StaticBody2D

onready var door: Sprite = get_node("Sprite")

var on_door: bool = false

func _process(_delta: float) -> void:
	if on_door and Input.is_action_just_pressed("interact"):
		TransitionScreen.fade_in("res://scenes/"+ self.name +".tscn")

func _on_InteractableArea_body_entered(body):
	if body is Player:
		door.frame = 0
		on_door = true

func _on_InteractableArea_body_exited(body):
	if body is Player:
		door.frame = 1
		on_door = false
