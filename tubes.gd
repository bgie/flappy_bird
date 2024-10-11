extends Area2D

signal tubes_passed_player()
var has_passed_player := false

func _process(delta):
	# Move to the left
	position.x -= 144 * delta
	
	if position.x < 32 and not has_passed_player:
		has_passed_player = true
		tubes_passed_player.emit()
	
	# When we are past the left edge of the screen...
	if position.x <= -72:	
		# Re-use the tubes, return them to the right (off screen)
		position.x += 288
		# Choose a random vertical position for the tube
		position.y = 128 + randi_range(-50, 50)
		# Reset the flag used for scoring points
		has_passed_player = false
