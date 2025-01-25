extends BossStates

# I think it's best if the boss does one attack then switches back to follow state
# we call the attack on enter and start a timer. on timers' end we switch back to follow.
# reason we have a timer and bool(can_attack) is so he doesnt try to do multiple attack every frame.

@onready var AttackCooldown = $"../../Timers/AttackCooldown"


var can_attack = true

func RandomAttack():
	#generate a random int for the attack; 1:"swing" 2: "spin" 3: "thrust"
	#then returns the attack animation
	var RandomNumber =  1#randi_range(1,3)
	match RandomNumber:
		1:
			$"../../SwordAnimationPlayer".play("swing")
		2:
			pass
		3:
			pass
	return RandomNumber

func attack():
	if can_attack == true:
		RandomAttack()
		can_attack = false
		AttackCooldown.start()
		

func enter():
	can_attack = true
	attack()
	
	
func physics_update(_delta: float):
	#attack()
	pass

func _on_attack_cooldown_timeout():
	$"../../SwordAnimationPlayer".play("idle_sword")
	#can_attack = false
	BossTransition.emit(self, "Follow")
