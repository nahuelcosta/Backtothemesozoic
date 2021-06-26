extends Control

var herramienta = false

func _process(delta):
	if Input.is_action_just_pressed("clickder"):
		GV.herramienta += 1
		if GV.herramienta > 3:
			GV.herramienta = 0
	
	if GV.reset == true:
		GV.texto = 0
		GV.moveP = "ninguno"
		GV.reset = false
		GV.cuentahuesos = 0
	
	if Input.is_key_pressed(1):
		GV.cuentahuesos = 3
	
	if GV.cuentahuesos == 3:
		Transicion._change_sceneP1()
		FinPuzzle._final_puzzle("res://Escenas/Demo.tscn")
		Transicion._change_sceneP2()
		
	match GV.herramienta:
		0:
			GV.texto = 0
		0.5:
			GV.texto = 0.5
		1:
			GV.texto = 1
		2:
			GV.texto = 2
		3:
			GV.texto = 3
	
	match GV.texto:
		0:
			$TextoAA.text = "Usa la brocha en el área de trabajo para encontrar restos fósiles."
		0.5:
			$TextoAA.text = "Sigue limpiando ahí, estás cerca de terminar."
		1:
			$TextoAA.text = "El martillo te ayudará a soltar el fósil, haz click izquierdo en este varias veces para soltarlo."
		2:
			$TextoAA.text = "Mueve el fósil a la mesa de trabajo, a tu izquierda."
		4:
			$TextoAA.text = "¡Excelente!, has terminado las excavaciones."
