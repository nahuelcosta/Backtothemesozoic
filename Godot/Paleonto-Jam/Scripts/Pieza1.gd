extends Area2D

var posicion_pieza = Vector2()
var mult = 1000
var demo = load("res://Escenas/Demo.tscn")
var start = false
var timer = false
var brocha = 0
var suma = 0
var move = Vector2(rand_range(20,120), rand_range(10, 210))

func _ready():
	randomize()
	position = move
	GV.texto = -1
	GV.herramienta = 0
	
func _physics_process(delta):
	var mover_pieza = get_local_mouse_position()
	if Input.is_action_pressed("click"):
		if suma >= 3:
			posicion_pieza = mover_pieza
			$Forma.position = posicion_pieza
			$Colision.position = posicion_pieza
			GV.texto = 1
		
	if Input.is_action_pressed("clickder"):
		$Forma/Bg.hide()
		$TiempoEspera.start()
		
	if timer == true:
		$TiempoClick.start()
		
	if GV.reset == true:
		_ready()
		
		
func _on_TiempoEspera():
	get_tree().change_scene_to(demo)

func _on_Pieza1_area_entered(area):
	suma += 1
