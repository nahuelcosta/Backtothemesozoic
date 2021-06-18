extends Control

func _process(delta):
	
	if GV.reset == true:
		GV.texto = 0
		GV.reset = false
	
	match GV.herramienta:
		0:
			GV.texto = 0
		0.5:
			GV.texto = 0.5
		1:
			GV.texto = 1
		2:
			GV.texto = 2
	
	match GV.texto:
		0:
			$TextoAA.text = "Usa la brocha en el área de trabajo para encontrar restos fósiles."
		0.5:
			$TextoAA.text = "Sigue limpiando ahí, estás cerca de terminar."
		1:
			$TextoAA.text = "El martillo te ayudará a soltar la pieza, haz click derecho en esta varias veces para soltarla."
		2:
			$TextoAA.text = "Mueve la pieza a la mesa de trabajo, a tu izquierda."
