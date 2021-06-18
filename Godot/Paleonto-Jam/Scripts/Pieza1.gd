extends Area2D

var posicion_pieza = Vector2()
var brocha = 0
var suma = 0
var sumaParaPinzas = 0
var cuentaPinzas = false
var move = Vector2(rand_range(20,120), rand_range(10, 210))
var demo = load("res://Escenas/Demo.tscn")
var moveP1 = 0

func _ready():
	randomize()
	position = move
	
func _on_Pieza1_area_entered(area):
	if GV.moveP == "ninguno": #Si no se ha detectado alguna pieza
		moveP1 += 1 #Se cambia el valor aquí, se queda en clavado como mayor a 1
	elif GV.moveP == "Pieza1":
		if GV.herramienta == 0:
			suma += 1
		elif GV.herramienta == 1:
			cuentaPinzas = true
	
func _physics_process(delta):
	_move(delta)
	
func _move(delta):
	if moveP1 >= 1:
		GV.moveP = "Pieza1"
	
	if suma <= 3:
		$Forma.frame = suma
		if suma > 1:
			GV.texto = 0.5
	
	if cuentaPinzas == true:
		if Input.is_action_just_pressed("click"):
			sumaParaPinzas += 1
	
	if suma == 3:
		GV.herramienta = 1
	
	if GV.moveP == "Pieza1":
		if sumaParaPinzas > 0 and sumaParaPinzas <= 3:
			$Forma.frame = 3 + sumaParaPinzas
	
		if sumaParaPinzas >= 3:
			GV.herramienta = 2
			$Forma.frame = 6
	
	var mover_pieza = get_local_mouse_position()
	if GV.moveP == "Pieza1":
		if GV.herramienta == 2:
			if Input.is_action_pressed("click"):
				posicion_pieza = mover_pieza
				$Forma.position = posicion_pieza
				$Colision.position = posicion_pieza
				GV.texto = 1
		
	if GV.reset == true:
		_ready()
		
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to(demo)
		
