extends "res://player/finite_state_machine.gd"

func _ready():
	states_map = {
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"triggered": $Triggered,
	}

func _change_state(state_name):
	if not _active:
		return
	if state_name in ["triggered", "jump"]:
		states_stack.push_front(states_map[state_name])
	if state_name == "jump" and current_state == $Move:
		$Jump.initialize($Move.speed, $Move.velocity)
		
	._change_state(state_name)
	
func _input(event):
	current_state.handle_input(event)

func _on_animation_finished(anim_name):
	._on_animation_finished(anim_name)
