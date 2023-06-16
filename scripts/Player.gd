extends KinematicBody2D
class_name Player

onready var animation: AnimationPlayer = get_node("Animation")
onready var sprite: Sprite = get_node("Sprite")

var moving = false
var velocity: Vector2

export (int) var speed

func _physics_process(_delta: float) -> void:
	move() #Movimentação
	animate() #Animação
	verify_direction() #Direção que o personagem se move, para inverter as sprites
	
	
func move() -> void:
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = direction_vector * speed
	velocity = move_and_slide(velocity)

func animate() -> void:
	if velocity != Vector2.ZERO:
		animation.play("Walk")
	else:
		animation.play("Idle")
	
func verify_direction() -> void:
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true

#Função que permite congelar o personagem ao interagir com objetos
func freeze(state: bool) -> void:
	animation.play("Idle")
	set_physics_process(state)

#Função para movimentação por touch
func _on_HUD_use_move_vector(move_vector):
	move_and_slide(move_vector * speed)
	if move_vector != Vector2.ZERO:
		animation.play("Walk")
	else:
		animation.play("Idle")
	
	if move_vector.x > 0:
		sprite.flip_h = false
	elif move_vector.x < 0:
		sprite.flip_h = true
