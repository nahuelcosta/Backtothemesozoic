extends Area2D

var posicion_pieza = Vector2()

func _ready():
	$ImgLaser.frame_coords.x = 0

func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.herramienta == 3:
		posicion_pieza = mover_pieza
		$ImgLaser.position = posicion_pieza
		$ColisionLaser.position = posicion_pieza
		$ImgLaser.frame_coords.x = 1
	
	elif GV.herramienta != 3:
		$ImgLaser.position = Vector2(38, 18)
		$ColisionLaser.position = Vector2(38, 18)
		$ImgLaser.frame_coords.x = 0
			
	if GV.reset == true:
		_ready()
		
