extends Control

var Menuprincipal = load("res://Escenas/Menuprincipal.tscn")

func _process(delta):
	if $Volver.pressed:
		get_tree().change_scene_to(Menuprincipal)
	elif $Salir.pressed:
		get_tree().quit()
	$TitleText.text = GV.perdiste
