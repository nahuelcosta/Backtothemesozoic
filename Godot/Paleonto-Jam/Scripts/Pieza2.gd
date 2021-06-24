extends Area2D

var posicion_pieza2 = Vector2()
var brocha2 = 0
var sumabrochaMartillo2 = 0
var sumaMartilloPinzas2 = 0
var sumaMartilloPinzasBool2 = false
var cuentaPinzas2 = false
var move2 = Vector2(rand_range(320,420), rand_range(10, 210))
var demo = load("res://Escenas/Demo.tscn")
var moveP2 = 0
var resetMoveP = 0

func _ready():
	randomize()
	position = move2
	$Forma2.frame = 0
	$AreaHueso2/FormaPuzzleColision2.hide()
	
func _Pieza2_entered(area):
	if GV.moveP == "ninguno":
		GV.moveP = "Pieza2"
	else:
		GV.moveP = "ninguno"
	
	sumabrochaMartillo2 += 1
	if Input.is_action_just_pressed("click"):
		sumaMartilloPinzas2 += 1
	
func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.moveP == "Pieza2":
		if GV.herramienta == 0:
			if $Forma2.frame >= 0 and $Forma2.frame <= 2:
				$Forma2.frame = sumabrochaMartillo2
	
		elif GV.herramienta == 1:
			if $Forma2.frame >= 3 and $Forma2.frame <= 5:
				if Input.is_action_just_pressed("click"):
					sumaMartilloPinzas2 += 1
				$Forma2.frame = 3 + sumaMartilloPinzas2
	
		elif GV.herramienta == 2:
			if $Forma2.frame == 6:
				if Input.is_action_pressed("click"):
					posicion_pieza2 = mover_pieza
					$Forma2.position = posicion_pieza2
					$Colision2.position = posicion_pieza2
					$AreaHueso2/FormaPuzzleColision2.position = posicion_pieza2
					$AreaHueso2/ColisionLaser2.position = posicion_pieza2
					$AreaHueso2/FormaPuzzleColision2.show()
					GV.texto = 1
			
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to(demo)

func _on_AreaHueso2_area_entered(area):
	if $Forma2.frame == 6:
		$AreaHueso2/TiempoLimpiar2.start()

func _on_AreaHueso2_area_exited(area):
	if GV.herramienta == 3:
		if GV.resetP == "Pieza2":
			$AreaHueso2/TiempoLimpiar2.stop()
			position = move2
			$AreaHueso2/FormaColisionLaser2.hide()
			$Forma2.frame = 0
	else:
		GV.resetP = "Pieza"

func _on_TiempoLimpiar2_timeout():
	$Forma2.hide()
	$Colision2.disabled
	$AreaHueso2/FormaPuzzleColision2.hide()
	$AreaHueso2/ColisionLaser2.disabled
	GV.cuentahuesos += 1
	GV.herramienta = 0
	$Forma2.frame += 1
	resetMoveP += 1
