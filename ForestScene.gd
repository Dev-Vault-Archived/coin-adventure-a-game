extends Node

signal time_changed(value)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer
var max_timing = 60

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = true
	timer.wait_time = 1.0
	timer.connect("timeout", self, "_timeout")

func _timeout():
	max_timing -= 1
	
	if max_timing <= 0:
		print("Selesai")
		
	print("Timed out!")
	
	emit_signal("time_changed", max_timing)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
