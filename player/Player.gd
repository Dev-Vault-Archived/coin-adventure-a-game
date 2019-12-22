extends KinematicBody2D

# Sinyal yang bisa diberikan dari scene Player
signal darah_berkurang(value)
signal coin_catched()

# Objek label untuk intruksi
onready var catch_info: NinePatchRect = $Notifier

# Maksimal health
var max_health = 100
var current_health = max_health
# Variabel apakah coin dapat di catch atau tidak
var can_catch_coin = false

# Ketika ready
func _ready():
	# Box di hide
	catch_info.hide()

# Ketika darah berkurang
func _trigger_darah_berkurang(value):
	# Darah dikurangi
	current_health -= value
	
	# Untuk menghindari negatif
	current_health = max(0, current_health)
	
	# Jika kosong, maka pass
	if current_health == 0:
		pass
	
	# Jika tidak, maka notifi darahb erkurang dan update
	emit_signal("darah_berkurang", current_health)

# Ketika dapat input
func _input(event):
	# Maka akna jalankan fungsi handle input
	handle_input(event)

# Handle input
func handle_input(event):
	# Jika kondisinya tidak mati
	if $StateMachine.current_state != $StateMachine/Death:
		# Dan menekan tombol C dan dan tidak dalam kondisi triggered
		if event.is_action_pressed("simulate_damage")  && $StateMachine.current_state != $StateMachine/Triggered:
			# Jika koin tidak dapat di catch, triggered statenya
			if !can_catch_coin:
				return $StateMachine._change_state("triggered")
			
			# Catch the coin
			can_catch_coin = false
			# Catch coin dengan kirim sinyal
			emit_signal("coin_catched")

# Ketika coin nempel ke player
func _on_Coin_coin_nempel_ke_player():
	can_catch_coin = true
	catch_info.show()

# Ketika coin tidak nempel ke player
func _on_Coin_coin_tidak_nempel_ke_player():
	can_catch_coin = false
	catch_info.hide()

# Ketika node mati, reset health
func _on_Node_death():
	current_health = max_health
	
