extends CanvasLayer

onready var anim_play : AnimationPlayer = $Animacion

func _change_scene(path : String):
	layer = 1
	anim_play.play("Fade")
	yield(anim_play, "animation_finished")
	get_tree().change_scene(path)
	anim_play.play_backwards("Fade")
	yield(anim_play, "animation_finished")
	layer = -1

func _ready():
	layer = -1
