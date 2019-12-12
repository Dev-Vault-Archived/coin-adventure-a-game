extends NinePatchRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Interface_time_changed_interface_on(value):
	var minutes = floor(value/60)
	var seconds = value%60
	
	$Label.text = str(minutes, ":", seconds)
