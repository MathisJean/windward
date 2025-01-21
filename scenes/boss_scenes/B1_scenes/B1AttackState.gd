extends BossStates


@onready var AttackCooldown = $"../../Timers/AttackCooldown"

@export var AnimationPlayerRef:AnimationPlayer

var can_attack = true
var InAggroArea = true

func RandomAttack():
	var RandomNumber = randi_range(1,3)
	match RandomNumber:
		1:
			pass
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
		print("isattacking")
		
func enter():
	pass
	
func exit():
	pass
	
func update(_delta: float):
	pass
		
	
func physics_update(_delta: float):
	attack()


func _on_attack_cooldown_timeout():
	BossTransition.emit(self, "Follow")


func _on_aggro_area_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		InAggroArea = false
