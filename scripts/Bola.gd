extends RigidBody2D
class_name Bola

var speed = 1.0
var velocity: Vector2
var reset = false
var initial_pos = Vector2(197, -413)

func _physics_process(_delta):
	if visible == true:
		apply_impulse(Vector2(), Vector2(Input.get_accelerometer().x * speed, - Input.get_accelerometer().y *speed))
		move()

func move() -> void:
	var direction_vector: Vector2 = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()
	
	velocity = direction_vector * speed
	apply_impulse(Vector2(), velocity)

func _integrate_forces(state):
	if reset == true:
		state.transform = Transform2D(0, initial_pos)
		state.linear_velocity = velocity
		reset = false
		
func _body_entered():
	reset = true
