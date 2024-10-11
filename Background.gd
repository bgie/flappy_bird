extends Sprite2D

func _process(delta):
	# Move to the left
	position.x -= 144 * delta
	
	# Creates the effect of an infinite scrolling background:
	#  when a certain position to the left is reached, jump back by 
	#  144 pixels. The background repeats every 144 pixels so 
	#  you will not notice this. We can keep doing this forever.
	if position.x <= -144:
		position.x += 144
