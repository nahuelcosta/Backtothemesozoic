extends Area2D

var posicion_pieza = Vector2()

func _ready():
	Vector2(885, 82)

func _physics_process(delta):
	var mover_pieza = get_local_mouse_position()
	if Input.is_action_pressed("click"):
		if GV.herramienta == 1:
			posicion_pieza = mover_pieza
			$ImgMartillo.position = posicion_pieza
			$ColisionMartillo.position = posicion_pieza
		elif GV.herramienta != 1:
			_ready()
			
	if GV.reset == true:
		_ready()
