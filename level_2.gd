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
	if Input.is_action_just_pressed("interact") and door == true:
		get_tree().change_scene_to_file("res://levels/End_Scene.tscn")

func _on_door_body_entered(body):
	door = true


func _on_door_body_exited(body):
	door = false
