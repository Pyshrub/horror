extends CharacterBody2D

@onready var SM = $StateMachine

@export var walking = 220
@export var running = 220
var direction = 1
var type = "demon"
func _ready():
	velocity.x = running
	SM.set_state("Move")

func _physics_process(_delta):
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity
	attack_target()
	if direction > 0 and not $AnimatedSprite2D.flip_h: 
		$AnimatedSprite2D.flip_h = true
	if direction < 0 and $AnimatedSprite2D.flip_h: 
		$AnimatedSprite2D.flip_h = false

	
func set_animation(anim):
	if $AnimatedSprite2D.animation == anim: return
	if $AnimatedSprite2D.sprite_frames.has_animation(anim): $AnimatedSprite2D.play(anim)
	else: $AnimatedSprite2D.play()



func should_attack():
	if $Attack1.is_colliding() and $Attack1.get_collider().name == "protag":
		return true
	if $Attack2.is_colliding() and $Attack2.get_collider().name == "protag":
		return true
	return false

func attack_target():
	if $Attack1.is_colliding():
		direction = -1
		return $Attack1.get_collider()
	elif $Attack2.is_colliding():
		direction = 1
		return $Attack2.get_collider()
	return null


func _on_anima_animation_finished():
	if SM.state_name == "Attack":
		SM.set_state("Move")
	if SM.state_name == "Die":
		queue_free()


func _on_area_2d_area_entered(area):
	print("yo")
	area.die()


func _on_timer_timeout():
	pass # Replace with function body.
