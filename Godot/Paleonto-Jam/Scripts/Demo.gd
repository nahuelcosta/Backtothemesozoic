extends Control

var ganaste = load("res://Escenas/Final.tscn")

func _ready():
	GV.monedas = 0

func _process(delta):
	if GV.monedas == 5:
		get_tree().change_scene_to(ganaste)
		GV.perdiste = "ganaste"
	if GV.reset == true:
		_ready()
	if $Jugador.position.y >= 1894.44812:
		get_tree().change_scene_to(ganaste)
		GV.perdiste = "gameover"
