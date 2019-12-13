extends Area2D

signal coin_nempel_ke_player
signal coin_tidak_nempel_ke_player

onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

#func _on_body_entered(body):
#	print("body_enter")
#	anim_player.play("fade_out")


func _on_Coin_body_entered(body):
	emit_signal("coin_nempel_ke_player")


func _on_Coin_body_exited(body):
	emit_signal("coin_tidak_nempel_ke_player")


func _on_Player_coin_catched():
	print("coin catched")
	anim_player.play("fade_out")

func _on_Node_death():
	pass


func _on_Node_reset():
	anim_player.play('bouncing')
