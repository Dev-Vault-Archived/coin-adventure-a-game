extends Control

signal darah_berkurang_interface_on(value)
signal time_changed_interface_on(value)

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
