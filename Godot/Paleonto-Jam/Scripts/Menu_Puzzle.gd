extends Control

var text = 0

func _process(delta):
	
	if $Chat/Chatbox.position.y > -375:
		$Chat.scroll_base_offset.y -= 0.4
	
