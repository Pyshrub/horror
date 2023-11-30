extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.velocity = Vector2.ZERO
	player.set_animation("flash")
	player.set_flash("show")

func physics_process(_delta):
	if Input.is_action_just_released("flash"):
		SM.set_state("Idle")
		player.set_flash("hide")
		
