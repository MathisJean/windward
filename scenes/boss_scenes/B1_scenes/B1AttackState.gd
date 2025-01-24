extends BossStates


@onready var AttackCooldown = $"../../Timers/AttackCooldown"

@export var AnimationPlayerRef:AnimationPlayer

var can_attack = true
var InAggroArea = true

func RandomAttack():
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
	if can_attack == true and InAggroArea ==true:
		RandomAttack()
		can_attack = false
		AttackCooldown.start()
		print("isattacking")
		

func update(_delta: float):
	if InAggroArea == false and can_attack:
		BossTransition.emit(self, "Follow")
	
	
func physics_update(_delta: float):
	attack()


func _on_attack_cooldown_timeout():
	$"../../SwordAnimationPlayer".play("RESET")
	BossTransition.emit(self, "Follow")


func _on_aggro_area_body_exited(body):
	if body.is_in_group("PlayerGroup"):
		InAggroArea = false
		pass
