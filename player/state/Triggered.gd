extends "state.gd"

var knockback_direction = Vector2()

func enter():
	owner._trigger_darah_berkurang(10)
	owner.get_node("AnimationPlayer").play("triggered")

func _on_animation_finished(anim_name):
	emit_signal("finished", "previous")
