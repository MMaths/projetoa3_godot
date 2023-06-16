extends StaticBody2D

onready var puzzle_scene: Node2D = $PuzzleCaixa
onready var puzzle_camera: Camera2D = $PuzzleCaixa/CameraPuzzle
onready var player_camera: Camera2D = get_parent().get_node("YSort/Player/Camera")
onready var lupa_off: AnimatedSprite = get_parent().get_node("YSort/Player/LupaIcon/Lupa")
onready var hud_off: CanvasLayer = get_parent().get_node("YSort/Player/HUD")

var puzzle_avaliable: bool = true
var can_interact: bool = false
var player_ref: KinematicBody2D = null
var scene_completed = false

func _physics_process(_delta: float) -> void:
	if puzzle_scene.visible == false:
		$PuzzleCaixa/Bola.mode = RigidBody2D.MODE_STATIC
	elif puzzle_scene.visible == true:
		$PuzzleCaixa/Bola.mode = RigidBody2D.MODE_RIGID
	
	if puzzle_avaliable == true:
		if Input.is_action_just_pressed("interact") and can_interact == true:
			print("interagindo com objeto")
			can_interact = false
			puzzle_scene.visible = true
			hud_off.visible = false
			player_ref.freeze(false)
			align_screen()

		if scene_completed == true:
			puzzle_avaliable = false
			self.remove_from_group("InteractableObject")
			lupa_off.visible = false
			puzzle_scene.visible = false
			hud_off.visible = true
			player_ref.freeze(true)
			align_screen()

	if Input.is_action_just_pressed("back") and puzzle_scene.visible == true:
			puzzle_scene.visible = false
			hud_off.visible = true
			player_ref.freeze(true)
			align_screen()

func align_screen() -> void:
	if player_camera.current == true:
		player_camera.current = false
		puzzle_camera.current = true
	elif puzzle_camera.current == true:
		puzzle_camera.current = false
		player_camera.current = true

func _on_body_entered(body) -> void:
	if body is Player:
		player_ref = body
		can_interact = true

func _on_body_exited(body) -> void:
	if body is Player:
		player_ref = null
		can_interact = false

func _on_Fim_body_entered(body):
	if body is Bola:
		scene_completed = true
