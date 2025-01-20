extends BossStates


@onready var AttackCooldown = $"../../Timers/AttackCooldown"


var can_attack = true
#do signal for swtching state if not in area note to self
func attack():
	if can_attack == true:
		can_attack = false
		AttackCooldown.start()

func enter():
	pass
	
func exit():
	pass
	
func update(_delta: float):
	pass
	
func physics_update(_delta: float):
	attack()


func _on_attack_cooldown_timeout():
	can_attack = true
