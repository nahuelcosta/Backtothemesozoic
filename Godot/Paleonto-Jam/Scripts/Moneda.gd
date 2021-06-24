extends StaticBody2D

func _on_Area_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
		GV.monedas += 1
	
	if body is KinematicBody2D:
		GV.investigar = true
	else:
		GV.investigar = false
		
