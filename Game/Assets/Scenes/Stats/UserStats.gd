extends VBoxContainer

func _physics_process(delta: float) -> void:
	get_node('Taps').text = "Taps: " + str(UserData.Taps)
	get_node('Multiplier').text = "Multiplier: " + str(UserData.Multiplier)
	get_node('Coins').text = "Coins: " + str(UserData.Coins)
	get_node('Chests').text = "Chests: " + str(UserData.Chests)

	if UserData.CoinsUnlocked == true:
		$Coins.visible = true
	else:
		$Coins.visible = false
