extends NinePatchRect

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = str(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Interface_coin_catched_interface_on():
	$Label.text = str(int($Label.text) + 1)


func _on_Interface_reset_interface_on():
	pass
