extends TabContainer

func _ready() -> void:
	$General/Scroll/Holder/AutoSave.value = Settings.autoSave
	$General/Scroll/Holder/Sound.pressed = Settings.Sound
	$General/Scroll/Holder/Taps.pressed = Settings.ShowTaps

func _physics_process(delta: float) -> void:
	if $General/Scroll/Holder/AutoSave.value > 1:
		$General/Scroll/Holder/AutoSave.suffix = "] Seconds"

	if $General/Scroll/Holder/AutoSave.value == 1:
		$General/Scroll/Holder/AutoSave.suffix = "] Second"

func _on_Sound_toggled(button_pressed: bool) -> void:
	Settings.Sound = button_pressed


func _on_AutoSave_value_changed(value: float) -> void:
	Settings.autoSave = value


func _on_Taps_toggled(button_pressed: bool) -> void:
	Settings.ShowTaps = button_pressed


func _on_QuickSave_pressed() -> void:
	SaveData.Save()
