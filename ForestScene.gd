extends Node

# Mendefinisikan semua sinyal custom yang akan diberikan
# dari script ini ke script atau screen lainnya
signal time_changed(value)
signal death()
signal reset()

# Variabel hitug mundur dari 60 atau 1 menit
var timer: Timer
var max_timing = 60

# Ready function
func _ready():
	# Play music
	MusicController.play("res://music/music.ogg")
	# pass

# Inisiasi screen
func _init():
	# Membuat timer memasukkan ke children dan
	# mekaukan konfigurasi dari timer
	timer = Timer.new()
	add_child(timer)
	timer.autostart = false # Tidak berjalan otomatis
	timer.wait_time = 1.0 # Berjalan setiap 1 detik
	# Konfigurasi callback, setiap timer berdetak, maka kaan menjalankan
	# fungsi dibawah ini
	timer.connect("timeout", self, "_timeout")

# Fungsi setiap timer mendetak
func _timeout():
	# Timing dikurangi satu
	max_timing -= 1
	# Jika timing kurang dari atau sama dengan 0, maka lakukan reset
	if max_timing <= 0:
		reset()
	
	# Broadcast sinyal bahwa waktu berubah dengan parameter
	emit_signal("time_changed", max_timing)

# Jika ada input dalam game
func _input(event):
	# Juka tombol "start game" ditekan atau enter dan keadaan player adalah MATI, maka akan menjalankan
	# script untuk melakukan inisiasi
	if event.is_action_pressed("start_game") && $Player/StateMachine.current_state == $Player/StateMachine/Death:
		# Hide label dan rectangle pada CanvasLayer
		$CanvasLayer/Label.hide()
		$CanvasLayer/ColorRect.hide()
		# Ganti status player
		$Player/StateMachine._change_state('idle')
		# Jalankan waktu/timer
		timer.start()
		# Berikan sinyal reset ke semua node
		emit_signal("reset")

# Jika coin diterima oleh Player, maka fungsi ini akan dijalankan
func _on_Player_coin_catched():
	# Reset game
	reset()

# Fungsi reset
func reset():
	# Broadcast sinyal mati ke semua node
	emit_signal("death")
	
	# Reset max timing menjadi semula
	max_timing = 60
	# Tampilkan label dan rectangle pada canvas layer
	$CanvasLayer/Label.show()
	$CanvasLayer/ColorRect.show()
	
	# Berhentikan timer
	timer.stop()
	# Ubah state dari player menjadi 'death' atau mati
	$Player/StateMachine._change_state('death')

# Jika darah berkurang
func _on_Player_darah_berkurang(value):
	# Jika darah kurang atau sama dengan 0, maka lakukan reset
	if value <= 0:
		# Panggil fungsi reset
		reset()