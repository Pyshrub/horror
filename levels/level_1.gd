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
		else:
			print("it's a bed")
	if Input.is_action_just_pressed("interact") and boxing == true:
		if sane == true:
			Global.found_flash = true
			print("you found a flashlight")
	if Input.is_action_just_pressed("interact") and door == true:
		if Global.found_flash == true and sane == false:
			print("you open the door and leave")
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
