extends Node
#gonna debug player and boss health in this to avoid headache
#should change it later on

var PlayerHealth = 100.0
var B1Health = 100.0
var PlayerDmg = 5.0
var B1Dmg = 10.0
var PlayerInvincible = false


func PlayerTakeDmg():
	PlayerHealth -= B1Dmg
		

func B1TakeDmg():
	B1Health -= PlayerDmg
