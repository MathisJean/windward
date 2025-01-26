extends BossStates

# I think it's best if the boss does one attack then switches back to follow state
# we call the attack on enter and start a timer. on timers' end we switch back to follow.
# reason we have a timer and bool(can_attack) is so he doesnt try to do multiple attack every frame.

@onready var AttackCooldown = $"../../Timers/AttackCooldown"
@onready var PlayerRef:Player
@onready var BossRef: BossClass
var can_attack = true
var knockback = 0.5

func RandomAttack():
	#generate a random int for the attack; 1:"swing" 2: "spin" 3: "thrust"
	#then returns the attack animation
	var RandomNumber =  randi_range(1,3)
	match RandomNumber:
		1:
			$"../../SwordAnimationPlayer".play("swing")
		2:
			$"../../SwordAnimationPlayer".play("spin")
		3:
			$"../../SwordAnimationPlayer".play("thrust")
	return RandomNumber

func attack():
	if can_attack == true:
		RandomAttack()
		can_attack = false
		AttackCooldown.start()


func enter():
	PlayerRef = get_tree().get_first_node_in_group("PlayerGroup")
	BossRef = get_tree().get_first_node_in_group("BossGroup")
	can_attack = true
	attack()

func _on_attack_cooldown_timeout():
	$"../../SwordAnimationPlayer".play("idle_sword")
	#can_attack = false
	BossTransition.emit(self, "Follow")


func _on_b_1_sword_body_entered(body):
	if body.is_in_group("PlayerGroup") and can_attack == false:
		GlobalScript.PlayerTakeDmg()
		
