extends CharacterBody2D

@export var SPEED = 100.0

@export var sprite : AnimatedSprite2D

var input : Vector2

func get_input():
	input.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	input.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	return input.normalized()

func play_animation(playerInput):
	if playerInput == Vector2.ZERO:
		sprite.play('idle')
	else:
		sprite.play('walk')
		if playerInput.x > 0:
			sprite.flip_h = false
		elif playerInput.x < 0:
			sprite.flip_h = true
	

func _process(delta: float) -> void:
	var playerInput = get_input()
	
	velocity = playerInput * SPEED
	
	move_and_slide()
	
	#if you don't have animations, comment this line \/
	play_animation(playerInput)
