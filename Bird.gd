extends Area2D

var speed := -50.0
var dead := false

signal game_over()

func _process(delta):
	if Input.is_action_just_pressed("flap") and not dead and position.y >= 0:
		$AnimatedSprite2D.play("flap")
		# Give a speed boost upwards
		speed = -250.0
	else:
		# Gravity will increase speed towards the bottom
		speed += 600.0 * delta

	# Move bird according to its' speed
	position.y += speed * delta
	
	if not dead:
		# Bird will rotate a bit depending on whether it is going up or down
		$AnimatedSprite2D.rotation_degrees = speed * 0.1
	else:
		# Dead bird starts spinning
		$AnimatedSprite2D.rotation_degrees += 270 * delta 

	# Bottom of the screen -> you die
	if position.y > 260:
		dead = true
		game_over.emit()


# Hitting a tube -> you die
func _on_area_entered(_area):
	# We do not emit 'game_over' yet so the bird can fall to the bottom of
	#  the screen, where 'game_over' is triggered.
	dead = true
