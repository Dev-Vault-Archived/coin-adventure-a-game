extends Node

var _player: AudioStreamPlayer

func _ready():
	_player = AudioStreamPlayer.new()
	add_child(_player)
	
	pass

# Play function with the track URL
func play(playback: String):
	_player.stream = load(playback)
	_player.play()
	pass

# Stop function
func stop():
	# Stop player
	# _player.stop()
	pass