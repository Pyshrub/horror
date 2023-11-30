extends Control


func _ready():
	pass



func _on_quit_pressed():
	get_tree().quit()

func _on_play_again_pressed():
	Global.reset()
	get_tree().change_scene_to_file("res://levels/level_1.tscn")
