extends CanvasLayer

#gonna have all the different bosses bars in it but hidden until their fight starts


func _process(delta):
	$Control/Boss1Container/B1HealthBar.value = GlobalScript.B1Health
	$Control/PlayerContainer/PlayerHealthBar.value = GlobalScript.PlayerHealth
