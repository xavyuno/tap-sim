extends Control

var Amount : int = 1

var TapsReward : int = 0
var CoinsReward : int = 0

var OpenChest : bool = false

func openChest():
	UserData.Chests -= 1
	UserData.Taps += 1000
	print("Chests Left: ", UserData.Chests)

func _physics_process(delta: float) -> void:
	if OpenChest == true and UserData.Chests > Amount:
		for a in Amount:
			openChest()
		OpenChest = false

func _on_Open_pressed() -> void:
	$Open.disabled = false
	$Open.text = "Opened!"
	$Icon.animation = "Open"
	OpenChest = true

func _on_Amount_value_changed(value: float) -> void:
	Amount = value
