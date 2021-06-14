extends KinematicBody2D

export (int) var velocidad
var reversa = false

func _physics_process(delta):
	if reversa == false:
		position.x += velocidad*delta
	else:
		position.x -= velocidad*delta

func _on_Contador():
	if reversa == false:
		reversa = true
	else:
		reversa = false
