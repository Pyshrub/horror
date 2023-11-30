extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.velocity = Vector2.ZERO
	player.set_animation("idle")

func physics_process(_delta):
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		SM.set_state("Moving")
	if Input.is_action_pressed("flash") and Global.found_flash == true:
		SM.set_state("Flash")
