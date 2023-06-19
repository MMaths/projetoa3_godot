extends Area2D

onready var porta := $PortaIcon as AnimatedSprite
onready var mission_accepted : Button = get_parent().get_node("YSort/Cases/Sprite/AcceptCase1")
onready var show_interaction: TouchScreenButton = get_parent().get_node("YSort/Player/HUD/InteractButton")

var on_door := false

func _on_Door_body_entered(_body):
	if mission_accepted.selected_case >= 1:
		on_door = true
		show_interaction.visible = true
		porta.show()

func _on_Door_body_exited(_body):
	on_door = false
	show_interaction.visible = false
	porta.hide()
	
func _process(_delta: float) -> void:
	if on_door and mission_accepted.selected_case >= 1 and Input.is_action_just_pressed("interact"):
		TransitionScreen.fade_in("res://scenes/"+ self.name +".tscn")
