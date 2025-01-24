extends BossClass



func _physics_process(delta):
	if velocity.x >= 0:
		$Sprites.scale.x = -1

	else:
		$Sprites.scale.x = 1
	if velocity.length() > 0:
		$B1AnimationPlayer.play("Follow")
	else:
		pass


	move_and_slide()


	
