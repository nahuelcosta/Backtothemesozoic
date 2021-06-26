extends CanvasLayer

onready var anim_play : AnimationPlayer = $Cinematica

func _final_puzzle(path : String):
	layer = 1
	anim_play.play("Cientifico")
	yield(anim_play, "animation_finished")
	get_tree().change_scene(path)
	layer = -1
