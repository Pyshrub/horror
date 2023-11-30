extends Node

@onready var SM = get_parent()
@onready var player = get_node("../..")

func _ready():
	await player.ready

func start():
	player.velocity = Vector2.ZERO
	player.set_animation("death")

	var time = $Timer
	time.start()

func _on_animated_sprite_2d_animation_finished():
	get_tree().quit()


func _on_timer_timeout():
	if Global.end == false:
		get_tree().change_scene_to_file("res://UI/game_over.tscn")
	else:
		pass

