extends Control

func _ready() -> void:
	Game.GameSetup()

func _on_Tap_pressed() -> void:
	Functions.AddTaps()
	if Settings.Sound == true and Settings.ShowTaps == false:
		$Tap/Sound.play()

func _on_Reset_pressed() -> void:
	Functions.ResetData(true)

func _on_Shop_pressed() -> void:
	get_node('Shop').visible = true
	get_node('Settings').visible = false

func _on_Settings_pressed() -> void:
	get_node('Settings').visible = true


func _on_SinglePlayer_tree_exiting() -> void:
	if SaveData.Saving == false:
		SaveData.Save()
