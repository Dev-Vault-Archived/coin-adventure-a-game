extends KinematicBody2D

signal darah_berkurang(value)

var max_health = 100
var current_health = max_health

func _trigger_darah_berkurang(value):
	current_health -= value
	
	current_health = max(0, current_health)
	
	if current_health == 0:
		pass
	
	emit_signal("darah_berkurang", current_health)