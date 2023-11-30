extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.set_animation("move")
func physics_process(_delta):
	var direction = Input.get_axis("left", "right")
	player.set_direction(direction)
	if direction:
		player.velocity.x = player.direction * player.SPEED
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	player.move_and_slide()
	if Input.is_action_pressed("flash") and Global.found_flash == true:
		SM.set_state("Flash")
	if direction == 0:
		SM.set_state("Idle")	
