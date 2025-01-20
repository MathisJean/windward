extends BossClass



func _physics_process(delta):
	if velocity.x >= 0:
		$Sprites.scale.x = -1

	else:
		$Sprites.scale.x = 1



	move_and_slide()


	
