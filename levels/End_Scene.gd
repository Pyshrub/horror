extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.end = true
	$AnimatedSprite2D2.play()
	$AnimatedSprite2D3.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
