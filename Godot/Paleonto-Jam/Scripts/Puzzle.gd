extends Control

func _process(delta):
	match GV.texto:
		0:
			$TextoAA.text = "No hay nada para informar"
		1:
			$TextoAA.text = "Esta es la información de la pieza 1"
		2:
			$TextoAA.text = "Esta es la información de la pieza 2"
		3:
			$TextoAA.text = "Esta es la información de la pieza 3"
		4:
			$TextoAA.text = "Esta es la información de la pieza 4"
		5:
			$TextoAA.text = "Esta es la información de la pieza 5"

