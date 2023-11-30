extends Camera2D

func _process(_delta):
	var target = get_node_or_null("/root/level_2/player_container")
	if target != null:
		position = target.position
