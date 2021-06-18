extends Area2D

var posicion_pieza = Vector2()

func _ready():
	$ImgBrocha.frame_coords.x = 0

func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.herramienta == 0:
		posicion_pieza = mover_pieza
		$ImgBrocha.position = posicion_pieza
		$ColisionBrocha.position = posicion_pieza
		$ImgBrocha.frame_coords.x = 1
	
	elif GV.herramienta != 0:
		$ImgBrocha.position = Vector2(31, 10)
		$ColisionBrocha.position = Vector2(31, 10)
		$ImgBrocha.frame_coords.x = 0
			
	if GV.reset == true:
		_ready()
