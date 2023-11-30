extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0
var direction = -1
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if direction < 0 and not $AnimatedSprite2D.flip_h: 
		$AnimatedSprite2D.flip_h = true
		$flash_container.transform.x.x = -1
		$flash_container.position.x += 1200
	if direction > 0 and $AnimatedSprite2D.flip_h:
		$AnimatedSprite2D.flip_h = false
		$flash_container.transform.x.x = 1
		$flash_container.position.x -= 1200
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

func set_direction(d):
	direction = d
	
func set_animation(anim, off=Vector2.ZERO):
	if $AnimatedSprite2D.animation == anim: return
	if $AnimatedSprite2D.sprite_frames.has_animation(anim): $AnimatedSprite2D.play(anim)
	else: $AnimatedSprite2D.play()
	$AnimatedSprite2D.offset = off
func set_flash(type):
	if type == "show":
		$flash_container.show()
	elif type == "hide":
		$flash_container.hide()
