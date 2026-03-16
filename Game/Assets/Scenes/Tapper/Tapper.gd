extends Sprite

var StayVisible : bool = false

func _physics_process(delta: float) -> void:
	if is_in_group("GoldenTapper"):
		if UserData.GoldenTappers == 0:
			queue_free()
	else:
		if UserData.Tappers == 0:
			queue_free()

func _ready() -> void:
	position.x = rand_range(1,1255)
	position.y = rand_range(1,715)

func _on_Timer_timeout() -> void:
	var ADD = UserData.Multiplier * Game.WorldMultiplier * 2
	if Settings.ShowTaps == true:
		var TapData = preload('res://Game/Assets/Scenes/TapData/TapData.tscn').instance()
		TapData.rect_position = get_node('Pos').position
		TapData.output = str(ADD)
		add_child(TapData)
	UserData.Taps += ADD

func _on_Radius_mouse_entered() -> void:
	$Holder/TapTime.text = "Tap Time: " + str($Timer.wait_time)
	$Holder.visible = true


func _on_Radius_mouse_exited() -> void:
	if StayVisible == false:
		$Holder.visible = false


func _on_Delete_pressed() -> void:
	if is_in_group("GoldenTapper"):
		UserData.GoldenTappers -= 1
	else:
		UserData.Tappers -= 1
	queue_free()


func _on_Radius_toggled(button_pressed: bool) -> void:
	StayVisible = button_pressed
