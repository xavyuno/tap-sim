extends Timer

func _physics_process(delta: float) -> void:
	wait_time = Settings.autoSave

func _on_AutoSave_timeout() -> void:
	if SaveData.Saving == false:
		SaveData.Save()
