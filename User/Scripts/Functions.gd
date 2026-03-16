extends Node

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed('Debug'):
		AddTaps()

func AddTaps():
	var ADD = UserData.Multiplier * Game.WorldMultiplier
	if Settings.ShowTaps == true:
		var TapData = preload('res://Game/Assets/Scenes/TapData/TapData.tscn').instance()
		get_tree().current_scene.add_child(TapData)
	UserData.Taps += ADD

func ResetData(Reset : bool):
	if Reset == true:
		SaveData.NewFile = true
		UserData.Taps = 0
		UserData.Multiplier = 1
		UserData.Coins = 0
		UserData.Chests = 0
		UserData.CoinsUnlocked = false
		UserData.Tappers = 0
		UserData.GoldenTappers = 0
		UserData.ShopAdd = 1
		UserData.MultiplierPrice = 50
