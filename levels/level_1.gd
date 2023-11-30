extends Node2D

var sane = false
var found_pills = false
var in_bed = false
var boxing = false
var door = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sane == true:
		$Interact_Container/Door.hide()
	elif sane == false:
		$Interact_Container/Door.show()
	if Input.is_action_just_pressed("interact") and in_bed == true:
		if sane == false and found_pills == false:
			found_pills = true
			var Dialogue2 = load("res://Dialogues/Dialogue2.tscn")
			var dialogue2 = Dialogue2.instantiate()
			dialogue2.position = Vector2(589,184)
			add_child(dialogue2)
		else:
			print("pills have already been found")
	if Input.is_action_just_pressed("interact") and boxing == true:
		if sane == true:
			Global.found_flash = true
			var Dialogue3 = load("res://Dialogues/Dialogue3.tscn")
			var dialogue3 = Dialogue3.instantiate()
			dialogue3.position = Vector2(589,184)
			add_child(dialogue3)
			print("you found a flashlight")
			$"Enemy Container".spawn_enemy()
	if Input.is_action_just_pressed("interact") and door == true:
		if Global.found_flash == true and sane == false:
			get_tree().change_scene_to_file("res://level_2.tscn")
			print("you open the door and leave")
		elif sane == true:
			print("what are you looking for?")
		else:
			print("you can't seem to see the handle")
	get_input()
	
func get_input():
	if Input.is_action_just_pressed("Pills") and found_pills == true:
		if sane == true:
			$Main.hide()
			$Sanity.show()
			sane = false
		else:
			$Main.show()
			$Sanity.hide()
			sane = true



func _on_bed_body_entered(body):
	in_bed = true


func _on_bed_body_exited(body):
	in_bed = false


func _on_flash_box_body_entered(body):
	boxing = true


func _on_flash_box_body_exited(body):
	boxing = false


func _on_door_body_entered(body):
	door = true


func _on_door_body_exited(body):
	door = false
