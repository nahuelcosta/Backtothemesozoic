extends Area2D

var posicion_pieza = Vector2()

func _ready():
	$ImgMartillo.frame_coords.x = 0

func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.herramienta == 1:
		posicion_pieza = mover_pieza
		$ImgMartillo.position = posicion_pieza
		$ColisionMartillo.position = posicion_pieza
		$ImgMartillo.frame_coords.x = 1
		if Input.is_action_just_pressed("click"):
			$MartilloWav.play()
	
	elif GV.herramienta != 1:
		$ImgMartillo.position = Vector2(38, 16)
		$ColisionMartillo.position = Vector2(38, 16)
		$ImgMartillo.frame_coords.x = 0
		
	if GV.reset == true:
		_ready()
