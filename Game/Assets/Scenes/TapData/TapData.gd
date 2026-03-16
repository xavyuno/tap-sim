extends Label

var output : String = ""

func Data():
	if get_parent().is_in_group("GoldenTapper"):
		text = "+" + output
	else:
		text = "+" + str(UserData.Multiplier * Game.WorldMultiplier)

func _ready() -> void:
	if Settings.Sound == true:
		$Tap.play()
	if get_parent().is_in_group("Tapper") or get_parent().is_in_group("GoldenTapper"):
		rect_position = get_parent().get_node('Pos').position
	else:
		rect_position = get_global_mouse_position()
	Data()

func _physics_process(delta: float) -> void:
	rect_position.y -= 3.5


func _on_Timer_timeout() -> void:
	queue_free()
