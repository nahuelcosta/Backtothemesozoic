extends Area2D

var posicion_pieza = Vector2()

func _ready():
	$ImgPinzas.frame_coords.x = 0

func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.herramienta == 2:
		posicion_pieza = mover_pieza
		$ImgPinzas.position = posicion_pieza
		$ColisionPinzas.position = posicion_pieza
		$ImgPinzas.frame_coords.x = 1
	
	elif GV.herramienta != 2:
		$ImgPinzas.position = Vector2(38, 20)
		$ColisionPinzas.position = Vector2(38, 20)
		$ImgPinzas.frame_coords.x = 0
			
		if GV.reset == true:
			_ready()
