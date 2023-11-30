extends Node2D
var enemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func spawn_enemy():
	enemy = load("res://enemies/reality_demon.tscn").instantiate()
	enemy.position = Vector2(0,0)
	add_child(enemy)
