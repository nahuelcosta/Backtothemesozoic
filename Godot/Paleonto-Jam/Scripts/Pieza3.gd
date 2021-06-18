extends Area2D

var posicion_pieza = Vector2()
var brocha3 = 0
var suma3 = 0
var sumaParaPinzas3 = 0
var cuentaPinzas3 = false
var move3 = Vector2(rand_range(620, 720), rand_range(10, 210))
var moveP3 = 0

func _ready():
	randomize()
	position = move3

func _on_Pieza3_area_entered(area):
	if GV.moveP == "ninguno": #Si no se ha detectado alguna pieza
		moveP3 += 1 #Se cambia el valor aquí, se queda en clavado como mayor a 1
	elif GV.moveP == "Pieza3":
		if GV.herramienta == 0:
			suma3 += 1
		elif GV.herramienta == 1:
			cuentaPinzas3 = true

func _physics_process(delta):
	_move(delta)
	
func _move(delta):
	if moveP3 >= 1:
		GV.moveP = "Pieza3"
	
	if suma3 <= 3:
		$Forma3.frame = suma3
		if suma3 > 1:
			GV.texto = 0.5
	
	if cuentaPinzas3 == true:
		if Input.is_action_just_pressed("click"):
			sumaParaPinzas3 += 1
	
	if suma3 == 3:
		GV.herramienta = 1
	
	if GV.moveP == "Pieza3":
		if sumaParaPinzas3 > 0 and sumaParaPinzas3 <= 3:
			$Forma3.frame = 3 + sumaParaPinzas3
	
		if sumaParaPinzas3 >= 3:
			GV.herramienta = 2
			$Forma3.frame = 6
	
	var mover_pieza = get_local_mouse_position()
	if GV.moveP == "Pieza3":
		if GV.herramienta == 2:
			if Input.is_action_pressed("click"):
				posicion_pieza = mover_pieza
				$Forma3.position = posicion_pieza
				$Colision3.position = posicion_pieza
				GV.texto = 1
