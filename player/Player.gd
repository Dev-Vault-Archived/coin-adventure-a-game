extends KinematicBody2D

signal darah_berkurang(value)
signal coin_catched

onready var catch_info: NinePatchRect = $Notifier

var max_health = 100
var current_health = max_health
var can_catch_coin = false

func _ready():
	catch_info.hide()

func _trigger_darah_berkurang(value):
	current_health -= value
	
	current_health = max(0, current_health)
	
	if current_health == 0:
		pass
	
	emit_signal("darah_berkurang", current_health)
	
func _input(event):
	handle_input(event)
	
func handle_input(event):
	if $StateMachine.current_state != $StateMachine/Death:
		if event.is_action_pressed("simulate_damage")  && $StateMachine.current_state != $StateMachine/Triggered:
			if !can_catch_coin:
				return $StateMachine._change_state("triggered")
			
			# Catch the coin
			can_catch_coin = false
			emit_signal("coin_catched")
		
func _on_Coin_coin_nempel_ke_player():
	can_catch_coin = true
	catch_info.show()

func _on_Coin_coin_tidak_nempel_ke_player():
	can_catch_coin = false
	catch_info.hide()

func _on_Node_death():
	current_health = max_health
	
