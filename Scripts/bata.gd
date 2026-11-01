extends StaticBody2D

@export var level: int = 1:
	set(value):
		level = value
		perbarui_warna()

@onready var color_rect: ColorRect = $ColorRect

var level_warna: Array[Color] = [
	Color("#ff4444"), # Level 1 (Merah - 1 kali pukul)
	Color("#ffaa44"), # Level 2 (Oranye - 2 kali pukul)
	Color("#ffff44"), # Level 3 (Kuning - 3 kali pukul)
	Color("#44ff44")  # Level 4 (Hijau - 4 kali pukul)
]

func _ready() -> void:
	perbarui_warna()

func perbarui_warna() -> void:
	if color_rect:
		var index = clamp(level - 1, 0, level_warna.size() - 1)
		color_rect.color = level_warna[index]

func kena_bola() -> void:
	level -= 1
	if level == 0:
		queue_free()
	else:
		perbarui_warna()
