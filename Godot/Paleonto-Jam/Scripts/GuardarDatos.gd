extends Node2D

export (int) var monedas = 1

func _ready():
	GV._ActualizaPuntos()
	
func _process(delta):
	$Monedas.text = "Monedas: " + str(GV.monedas)


func _on_SumarMonedas_pressed():
	GV.monedas += monedas
	GV._ActualizaPuntos()
	
