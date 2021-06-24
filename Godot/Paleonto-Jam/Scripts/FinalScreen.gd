extends Control

func _process(delta):
	if GV.informacion == 0:
		$Screen.animation = "0"
	elif GV.informacion == 4:
		$Screen.animation = "100"
	elif GV.informacion > 1 and GV.informacion < 4:
		$Screen.animation = "75"
