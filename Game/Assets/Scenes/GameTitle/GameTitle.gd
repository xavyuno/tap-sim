extends Timer

var Ran : int = 1

func _physics_process(delta: float) -> void:
	if OS.get_name() == "Android":
		queue_free()
	if Ran < 50:
		OS.set_window_title("Tap Sim [ Taps: " + var2str(UserData.Taps) + " ]")

func _on_GameTitle_timeout() -> void:
	Ran = convert(rand_range(1, 101), TYPE_INT)
	if Ran == 50:
		OS.set_window_title("Tap Sim [ Code: freetaps ]")
	if Ran > 50:
		OS.set_window_title("Tap Sim [ V" + var2str(Game.Version) + " ]")
