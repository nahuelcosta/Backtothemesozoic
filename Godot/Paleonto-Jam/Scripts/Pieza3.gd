extends Area2D

var posicion_pieza3 = Vector2()
var brocha3 = 0
var sumabrochaMartillo3 = 0
var sumaMartilloPinzas3 = 0
var sumaMartilloPinzasBool3 = false
var cuentaPinzas3 = false
var move3 = Vector2(rand_range(630,730), rand_range(10, 310))
var demo = load("res://Escenas/Demo.tscn")
var moveP3 = 0

func _ready():
	randomize()
	position = move3
	$Forma3.frame = 0
	$AreaHueso3/FormaPuzzleColision3.hide()
	
func _Pieza3_entered(area):
	if GV.moveP == "ninguno":
		GV.moveP = "Pieza3"
	else:
		GV.moveP = "ninguno"
	
	sumabrochaMartillo3 += 1
	if Input.is_action_just_pressed("click"):
		sumaMartilloPinzas3 += 1
	
func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.moveP == "Pieza3":
		if GV.herramienta == 0:
			if $Forma3.frame >= 0 and $Forma3.frame <= 2:
				$Forma3.frame = sumabrochaMartillo3
	
		elif GV.herramienta == 1:
			if $Forma3.frame >= 1 and $Forma3.frame <= 5:
				if Input.is_action_just_pressed("click"):
					sumaMartilloPinzas3 += 1
				$Forma3.frame = 3 + sumaMartilloPinzas3
	
		elif GV.herramienta == 3:
			if $Forma3.frame == 6:
				if Input.is_action_pressed("click"):
					posicion_pieza3 = mover_pieza
					$Forma3.position = posicion_pieza3
					$Colision3.position = posicion_pieza3
					$AreaHueso3/FormaPuzzleColision3.position = posicion_pieza3
					$AreaHueso3/ColisionLaser3.position = posicion_pieza3
					$AreaHueso3/FormaPuzzleColision3.show()
					GV.texto = 1
			
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to(demo)
		

func _on_AreaHueso3_area_entered(area):
	if $Forma3.frame == 6:
		$AreaHueso3/TiempoLimpiar3.start()

func _on_AreaHueso3_area_exited(area):
	if GV.herramienta == 3:
		if GV.resetP == "Pieza3":
			$AreaHueso1/TiempoLimpiar.stop()
			position = move3
			GV.moveP = "ninguno"
			$AreaHueso3/FormaColisionLaser3.hide()
			$Forma3.frame = 0
	else:
		GV.resetP = "Pieza"

func _on_TiempoLimpiar3_timeout():
	$Forma3.hide()
	$Colision3.disabled
	$AreaHueso3/FormaPuzzleColision3.hide()
	$AreaHueso3/ColisionLaser3.disabled
	GV.cuentahuesos += 1
	GV.herramienta = 0
	GV.moveP = "ninguno"
	$Forma3.frame += 1
