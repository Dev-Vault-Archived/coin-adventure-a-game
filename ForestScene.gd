extends Node

signal time_changed(value)
signal death
signal reset

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer
var max_timing = 60

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.autostart = false
	timer.wait_time = 1.0
	timer.connect("timeout", self, "_timeout")

func _timeout():
	max_timing -= 1
	
	if max_timing <= 0:
		reset()
		
	print("Timed out!")
	
	emit_signal("time_changed", max_timing)

func _input(event):
	if event.is_action_pressed("start_game") && $Player/StateMachine.current_state == $Player/StateMachine/Death:
		$CanvasLayer/Label.hide()
		emit_signal("reset")
		$Player/StateMachine._change_state('idle')
		timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_coin_catched():
	reset()

func reset():
	emit_signal("death")
	
	max_timing = 60
	$CanvasLayer/Label.show()
	timer.stop()
	$Player/StateMachine._change_state('death')
	print("Selesai")

func _on_Player_darah_berkurang(value):
	if value <= 0:
		reset()