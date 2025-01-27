extends State
# for now, unless we want to make some combo logic with multiplw inputs, We will make it like the boss atk
#attack on enter and start a timer, on timer timeout switch back to moving or idle state

@onready var attack_cooldown = $"../../timers/attack_cooldown"
@onready var attack_hitbox = $"../../PlayerSwordHitbox"


func _ready():
	var can_attack = true
	if can_attack:
		attack_cooldown.start()
		attack_hitbox.set_deferred("monitoring", true)
		$"../../PlayerSwordHitbox/swingAnim".play("swing")
		can_attack = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_cooldown_timeout():
	#can_attack = true
	attack_hitbox.set_deferred("monitoring", false)
	StateTransition.emit(self, "Idle")
	print("timer end")

func _on_player_sword_hitbox_body_entered(body):
	if body.is_in_group("BossGroup"):
		print("hit boss")
