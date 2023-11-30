extends Node

@onready var SM = get_parent()
@onready var enemy = get_node("../..")
var place
func _ready():
	await enemy.ready

func start():
	enemy.set_animation("moving")

func physics_process(_delta):
	if enemy.should_attack():
		SM.set_state("attack")
	if not enemy.is_on_floor():
		enemy.velocity.y += 50
	else: enemy.velocity.y = 0


func _on_area_2d_body_entered(body):
	SM.set_state("Attack")
	body.die()

