extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var start_pos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	start_pos = rect_position

func _physics_process(delta):
	rect_position = $"../BodyPivot".position + start_pos
