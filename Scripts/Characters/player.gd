extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 300.0


func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction.x == 0 and direction.y == 0:
		animated_sprite_2d.play("idle")
	elif direction.y > 0 or direction.y < 0:
		animated_sprite_2d.play("skate")
	elif direction.x < 0:
		animated_sprite_2d.play("skate")
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.play("skate")
		animated_sprite_2d.flip_h = false
	velocity = direction * SPEED
	move_and_slide()
