extends StaticBody2D

func _on_Area_body_entered(body):
	if body is KinematicBody2D:
		queue_free()
		GV.monedas += 1
