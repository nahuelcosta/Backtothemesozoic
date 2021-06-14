extends Area2D

var posicion_pieza = Vector2()

func _ready():
	$ImgBrocha.frame_coords.x = 0
	position = Vector2(885, 15)

func _physics_process(delta):
	var mover_pieza = get_local_mouse_position()
	if Input.is_action_pressed("click"):
		if GV.herramienta == 0:
			posicion_pieza = mover_pieza
			$ImgBrocha.position = posicion_pieza
			$ColisionBrocha.position = posicion_pieza
			$ImgBrocha.frame_coords.x = 1
		elif GV.herramienta != 0:
			_ready()
			
		if GV.reset == true:
			_ready()
