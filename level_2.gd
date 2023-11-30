extends Node2D

var found_pills = true
var sane = false
var in_bed = false
var boxing = false
var door = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Pills") and found_pills == true:
		if sane == true:
			$Main2.hide()
			$Sanity2.show()
			sane = false
		else:
			$Main2.show()
			$Sanity2.hide()
			sane = true
