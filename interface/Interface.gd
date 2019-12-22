extends Control

signal darah_berkurang_interface_on(value)
signal time_changed_interface_on(value)
signal coin_catched_interface_on()
signal death_interface_on()
signal reset_interface_on()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_darah_berkurang(value):
	emit_signal("darah_berkurang_interface_on", value)


func _on_Node_time_changed(value):
	emit_signal("time_changed_interface_on", value)


func _on_Player_coin_catched():
	emit_signal("coin_catched_interface_on")


func _on_Node_death():
	emit_signal("death_interface_on")


func _on_Node_reset():
	emit_signal("reset_interface_on")
