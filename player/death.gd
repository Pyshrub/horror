extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.velocity = Vector2.ZERO
	player.set_animation("death")

func _on_animated_sprite_2d_animation_finished():
	get_tree().quit()


func _on_timer_timeout():
	pass # Replace with function body.
