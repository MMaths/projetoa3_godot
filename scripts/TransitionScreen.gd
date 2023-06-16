extends CanvasLayer

signal start_game

onready var animation = get_node("Animation")

var target_level: String

func fade_in(level: String) -> void:
	target_level = level
	animation.play("fade_in")

func _on_Animation_animation_finished(anim_name):
	if anim_name == "fade_in":
		var _change_level = get_tree().change_scene(target_level)
		animation.play("fade_out")
	elif anim_name == "fade_out":
		emit_signal("start_game")
