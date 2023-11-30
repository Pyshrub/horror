extends Control

var dialogue = [
	'Where am I????',
	'Ugh..need to find my pills. Pretty sure I had them when sleeping',
	'(Use E to interact)'
]

var dialogue_index = 0
var finished = false



func _read():
	load_dialogue()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialogue()
func load_dialogue():
	if dialogue_index < dialogue.size():
		#$RichTextLabel.bbcode_text = dialogue1[dialogue_index] (IGNORE THIS LINE BUT DO NOT DELETE)
		$Label.text = dialogue[dialogue_index]
	else:
		queue_free()
	dialogue_index += 1
