extends HBoxContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var max_health = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgress.max_value = max_health
	$TextureProgress.value = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Interface_darah_berkurang_interface_on(value):
	$Counter/Label.text = str(value, "/", max_health)
	$TextureProgress.value = value
