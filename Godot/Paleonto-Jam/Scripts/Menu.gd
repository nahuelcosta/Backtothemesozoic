extends Control

var inicio = load("res://Escenas/Puzzle.tscn")

func _process(delta):
	if $Start.pressed:
		get_tree().change_scene_to(inicio)
		GV.reset = true
