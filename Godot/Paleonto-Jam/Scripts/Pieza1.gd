extends Area2D

var posicion_pieza = Vector2()
var brocha = 0
var sumaBrochaMartillo = 0
var sumaMartilloPinzas = 0
var sumaMartilloPinzasBool = false
var cuentaPinzas = false
var move = Vector2(rand_range(20,120), rand_range(10, 210))
var demo = load("res://Escenas/Demo.tscn")
var moveP1 = 0

func _ready():
	randomize()
	position = move
	$Forma.frame = 0
	$AreaHueso1/FormaColisionLaser.hide()
	
func _Pieza1_entered(area):
	if GV.moveP == "ninguno":
		GV.moveP = "Pieza1"
	else:
		GV.moveP = "ninguno"
	
	sumaBrochaMartillo += 1
	if Input.is_action_just_pressed("click"):
		sumaMartilloPinzas += 1
	
func _process(delta):
	var mover_pieza = get_local_mouse_position()
	if GV.moveP == "Pieza1":
		if GV.herramienta == 0:
			if $Forma.frame >= 0 and $Forma.frame <= 2:
				$Forma.frame = sumaBrochaMartillo
	
		elif GV.herramienta == 1:
			if $Forma.frame >= 3 and $Forma.frame <= 5:
				if Input.is_action_just_pressed("click"):
					sumaMartilloPinzas += 1
				$Forma.frame = 3 + sumaMartilloPinzas
	
		elif GV.herramienta == 2:
			if $Forma.frame == 6:
				if Input.is_action_pressed("click"):
					posicion_pieza = mover_pieza
					$Forma.position = posicion_pieza
					$Colision.position = $Forma.position
					$AreaHueso1/FormaColisionLaser.position = $Forma.position
					$AreaHueso1/ColisionLaser.position = $Forma.position
					$AreaHueso1/FormaColisionLaser.show()
					GV.texto = 1
			
	if Input.is_key_pressed(KEY_1):
		get_tree().change_scene_to(demo)
		

func _on_AreaHueso1_area_entered(area):
	if $Forma.frame == 6:
		$AreaHueso1/TiempoLimpiar.start()

func _on_AreaHueso1_area_exited(area):
	if GV.herramienta == 3:
		if GV.resetP == "Pieza1":
			$AreaHueso1/TiempoLimpiar.stop()
			position = move
			$AreaHueso1/FormaColisionLaser.hide()
			$Forma.frame = 0
	else:
		GV.resetP = "Pieza"

func _on_TiempoLimpiar_timeout():
	$Forma.hide()
	$Colision.disabled
	$AreaHueso1/FormaColisionLaser.hide()
	$AreaHueso1/ColisionLaser.disabled
	GV.cuentahuesos += 1
	GV.herramienta = 0
