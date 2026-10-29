extends StaticBody2D

var lebar_window: int
var lebar_stik: int

const KECEPATAN_STIK: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lebar_window = get_viewport_rect().size.x
	lebar_stik = $ColorRect.get_size().x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		position.x += KECEPATAN_STIK * delta
	if Input.is_action_pressed("ui_left"):
		position.x -= KECEPATAN_STIK * delta
	
	position.x = clamp(position.x, lebar_stik / 2, lebar_window - lebar_stik / 2)
