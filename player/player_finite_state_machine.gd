extends "res://player/finite_state_machine.gd"

# Ketika ready
func _ready():
	# Map state dengan string
	states_map = {
		"death": $Death,
		"idle": $Idle,
		"move": $Move,
		"jump": $Jump,
		"triggered": $Triggered,
	}

# FUngsi mengubah state
func _change_state(state_name):
	# Ketika tidak active, maka akan di skip
	if not _active:
		return
	# Jika state adalah triggered / jump / death, maka stack akan ditambahkan state tersebut
	if state_name in ["triggered", "jump", "death"]:
		states_stack.push_front(states_map[state_name])
	# Jika statenya adalah jump dan state sekarang adalah bergerak, maka akan ada perlakuan spesial
	if state_name == "jump" and current_state == $Move:
		$Jump.initialize($Move.speed, $Move.velocity)
	
	# Ubah state
	._change_state(state_name)

# Fungsi input
func _input(event):
	# Akan di handle oleh state
	current_state.handle_input(event)

# Fungsi animasi
func _on_animation_finished(anim_name):
	# Dihandle oleh root
	._on_animation_finished(anim_name)
