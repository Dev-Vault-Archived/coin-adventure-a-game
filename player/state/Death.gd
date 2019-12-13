extends "state.gd"

func enter():
	owner.get_node("AnimationPlayer").play("idle")

func handle_input(event):
	return .handle_input(event)
