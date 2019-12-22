extends Area2D

# Membuat sinyal, terdapat 2 sinyal yaitu
# sinyal ketika coin menempel ke player dan
# sinyal ketika koin tidak menempel ke player (keluar area)
signal coin_nempel_ke_player()
signal coin_tidak_nempel_ke_player()

# Variabel untuk animasi
onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

# Posisi dari koin
var pos = Vector2(0, 0)
# Just a random variable
var randomX = 0
var randomY = 0

var left = -640
var up = -640
var right = 3432
var bottom = 1215
var tile = 64

# Ketika object ready, maka...
func _ready():
	# Koneksikan sinyal ke fungsi
	connect("area_entered", self, "_on_Coin_body_exited")
	# Randomize posisi dari coin
	randomize_position()

# Fungsi untuk merandom posisi dari koin
# namun tidak optimal karena kadang-kadang koin disimpan
# pada posisi objek yang collision dengan player
func randomize_position():
	# Randomize untuk nilai 0 - width, dan 0 - height
	var rX = randi()%(right)
	var rY = randi()%(bottom)
	
	# Randomize untuk sisa pixel di area negatif
	var rXM = -randi()%int(abs(left))
	var rYM = -randi()%int(abs(up))
	
	# Posisikan koin pada tiap ujung tiles
	randomX = int(floor((rX+rXM)/64))*64
	randomY = int(floor((rY+rYM)/64))*64
	
	# Ubah posisi dair koin menjadi posisi yang sudah ditentukan
	pos.x = randomX
	pos.y = randomY
	print(pos)
	position = pos

# Fungsi yang dijakankan ketika ada body masuk ke koin
func _on_Coin_body_entered(body):
	# Jika player maka kirim sinyal koin nempel ke player
	if body.get_name() == "Player":
		emit_signal("coin_nempel_ke_player")

# Fungsi dijalankan ketika body keluar dari koin
func _on_Coin_body_exited(body):
	# Hanya berlaku untuk player saja
	if body.get_name() == "Player":
		emit_signal("coin_tidak_nempel_ke_player")

# Ketika coin di catch, maka animasikan fadeout
func _on_Player_coin_catched():
	# Putar animasi
	anim_player.play("fade_out")

# Ketika tombol reset diberikan
func _on_Node_reset():
	# Randomize posisi dan jalankan animasi bouncing / default
	randomize_position()
	anim_player.play('bouncing')