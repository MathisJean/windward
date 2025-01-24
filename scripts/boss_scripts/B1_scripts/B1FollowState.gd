extends BossStates

var BossRef:BossClass 
var PlayerRef:Player
var Speed = 0.5

func enter():
	PlayerRef = get_tree().get_first_node_in_group("PlayerGroup")
	BossRef = get_tree().get_first_node_in_group("BossGroup")
	$"../../SwordAnimationPlayer".play("idle_sword")
	
func FollowPlayer():
	
	var DistanceToPlayer:float = PlayerRef.position.x - BossRef.position.x
	if DistanceToPlayer >= 20:
		BossRef.velocity.x  = DistanceToPlayer * Speed
	elif DistanceToPlayer <= 20:
		BossRef.velocity.x  = DistanceToPlayer * Speed
	else:
		pass
		
		
		
func update(_delta: float):
	FollowPlayer()


func _on_aggro_area_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		BossTransition.emit(self, "Attack")
