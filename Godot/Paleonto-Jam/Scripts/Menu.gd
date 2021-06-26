extends Control

var inicio = load("res://Escenas/Puzzle.tscn")

func _process(delta):
	if $Start.pressed:
		Transicion._change_scene("res://Escenas/Puzzle.tscn")
		GV.herramienta = 0
		#get_tree().change_scene_to(inicio)
		GV.reset = true
