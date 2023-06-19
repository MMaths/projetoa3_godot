extends StaticBody2D
class_name IObject

onready var quest_mark: AnimatedSprite = get_node("QuestMark")
onready var cases_board: Control = get_parent().get_node("Cases")
onready var cases_back_button: Button = get_parent().get_node("Cases/Background/CasesBackButton")
onready var selected_case: Button = get_parent().get_node("Cases/Sprite/AcceptCase1")
onready var missions_camera: Camera2D = get_parent().get_node("Cases/CasesCamera")
onready var player_camera: Camera2D = get_parent().get_node("Player/Camera")
onready var lupa_off: AnimatedSprite = get_parent().get_node("Player/LupaIcon/Lupa")
onready var hud_off: CanvasLayer = get_parent().get_node("Player/HUD")
onready var interact_button_off: TouchScreenButton = get_parent().get_node("Player/HUD/InteractButton")

var mission_avaliable: bool = true
var can_interact: bool = false
var player_ref: KinematicBody2D = null

func _physics_process(_delta: float) -> void:
	if mission_avaliable == true:
		quest_mark.visible = true
	elif mission_avaliable == false:
		quest_mark.visible = false

	if mission_avaliable == true:
		if Input.is_action_just_pressed("interact") and can_interact == true:
			print("interagindo com objeto")
			can_interact = false
			cases_board.visible = true
			hud_off.visible = false
			player_ref.freeze(false)
			align_screen()

		if selected_case.disabled == true:
			mission_avaliable = false
			self.remove_from_group("InteractableObject")
			lupa_off.visible = false
			interact_button_off.visible = false

	if Input.is_action_just_pressed("back") and cases_board.visible == true:
			cases_board.visible = false
			hud_off.visible = true
			player_ref.freeze(true)
			align_screen()

func align_screen() -> void:
	if player_camera.current == true:
		player_camera.current = false
		missions_camera.current = true
	elif missions_camera.current == true:
		missions_camera.current = false
		player_camera.current = true

func _on_body_entered(body) -> void:
	if body is Player:
		player_ref = body
		can_interact = true

func _on_body_exited(body) -> void:
	if body is Player:
		player_ref = null
		can_interact = false

func _on_Cases_back_pressed(go_back):
	if go_back == true:
		cases_board.visible = false
		hud_off.visible = true
		player_ref.freeze(true)
		align_screen()
