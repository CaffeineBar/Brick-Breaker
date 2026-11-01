extends Node2D

@export var bata_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	munculkan_bata()

func munculkan_bata() -> void:
	var jumlah_kolom: int = 7
	var jumlah_baris: int = 4
	var lebar_bata: int = 100
	var tinggi_bata: int = 40
	var jarak: int = 10
	
	# Menghitung posisi agar bata berada di tengah secara horizontal
	var total_lebar = (jumlah_kolom * lebar_bata) + ((jumlah_kolom - 1) * jarak)
	var offset_x = (get_viewport_rect().size.x - total_lebar) / 2
	var offset_y = 80 # Jarak dari atas layar
	
	for baris in range(jumlah_baris):
		# Menentukan level: Baris paling bawah = 1, paling atas = 4
		# (Karena baris 0 ada di atas, kita balik angkanya)
		var level_bata = jumlah_baris - baris 
		
		for kolom in range(jumlah_kolom):
			var bata = bata_scene.instantiate()
			
			# Hitung koordinat X dan Y per bata
			var pos_x = offset_x + (kolom * (lebar_bata + jarak))
			var pos_y = offset_y + (baris * (tinggi_bata + jarak))
			bata.position = Vector2(pos_x, pos_y)
			
			# Set level bata sebelum dimasukkan ke pohon scene
			bata.level = level_bata
			
			# Masukkan ke group "bata" agar terdeteksi oleh bola
			bata.add_to_group("bata")
			
			# Tambahkan sebagai anak dari Main Scene
			add_child(bata)
