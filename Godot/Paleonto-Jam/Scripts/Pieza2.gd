extends Area2D

var posicion_pieza2 = Vector2()
var brocha2 = 0
var suma2 = 0
var sumaParaPinzas2 = 0
var cuentaPinzas2 = false
var move2 = Vector2(rand_range(320, 420), rand_range(10, 210))
var moveP2 = 0

func _ready():
	randomize()
	position = move2
	
func _on_Pieza2_area_entered(area):
	if GV.moveP == "ninguno":
		moveP2 +=1
	elif GV.moveP == "Pieza2":
		if GV.herramienta == 0:
			suma2 += 1
		elif GV.herramienta == 1:
			cuentaPinzas2 = true
	
func _physics_process(delta):
	_move2(delta)
	
func _move2(delta):
	if moveP2 >= 1:
		GV.moveP = "Pieza2"
	
	if suma2 <= 3:
		$Forma2.frame = suma2
		if suma2 > 1:
			GV.texto = 0.5
	
	if cuentaPinzas2 == true:
		if Input.is_action_just_pressed("click"):
			sumaParaPinzas2 += 1
	
	if suma2 == 3:
		GV.herramienta = 1
		
	if GV.moveP == "Pieza2":
		if sumaParaPinzas2 > 0 and sumaParaPinzas2 <=3:
			$Forma2.frame = 3 + sumaParaPinzas2
	
	if sumaParaPinzas2 >= 3:
		GV.herramienta = 2
		$Forma2.frame = 6
	
	var mover_pieza2 = get_local_mouse_position()
	if GV.moveP == "Pieza2":
		if GV.herramienta == 2:
			if Input.is_action_pressed("click"):
				posicion_pieza2 = mover_pieza2
				$Forma2.position = posicion_pieza2
				$Colision2.position = posicion_pieza2
				GV.texto = 1
		
	if GV.reset == true:
		_ready()
