extends CharacterBody2D

@onready var player: StaticBody2D = $"../Player"

const KECEPATAN_AWAL: int = 500
const AKSELERASI: int = 50
var ukuran_window: Vector2
var kecepatan: int
var arah: Vector2
const VECTOR_Y_MAKSIMAL: float = 0.6

func _ready() -> void:
	ukuran_window = get_viewport_rect().size
	bola_baru()

func bola_baru() -> void:
	kecepatan = KECEPATAN_AWAL
	position.x = ukuran_window.x / 2
	position.y = ukuran_window.y - 83
	arah = arah_random()

func arah_random():
	var arah_baru := Vector2()
	arah_baru.x = [1, -1].pick_random() #menentukan arah kanan atau kiri secara acak di awal
	arah_baru.y = -1
	return arah_baru.normalized()

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(arah * kecepatan * delta)
	var collider
	
	if collision:
		collider = collision.get_collider()
		if collider == player:
			kecepatan += AKSELERASI
			arah = kalkulasi_arah_baru(collider)
			#play audio
		else:
			arah = arah.bounce(collision.get_normal())
		
		if collider.is_in_group("bata"):
			if collider.has_method("kena_bola"):
				collider.kena_bola()

func kalkulasi_arah_baru(collider):
	var bola_x = position.x
	var padel_x = collider.position.x
	var jarak = bola_x - padel_x
	var arah_baru := Vector2()
	
	if arah.y > 0:
		arah_baru.y = -1
	else:
		arah_baru.y = 1
	
	arah_baru.x = (jarak / (collider.lebar_stik / 2)) * VECTOR_Y_MAKSIMAL
	return arah_baru.normalized()
