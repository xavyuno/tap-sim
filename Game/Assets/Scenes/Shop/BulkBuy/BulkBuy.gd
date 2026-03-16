extends VBoxContainer

func _physics_process(delta: float) -> void:
	get_node('Info').text = "Buying [" + str(UserData.ShopAdd) + "] at a time."

func _on_1_pressed() -> void:
	UserData.ShopAdd = 1

func _on_10_pressed() -> void:
	UserData.ShopAdd = 10

func _on_100_pressed() -> void:
	UserData.ShopAdd = 100

func _on_Input_text_entered(new_text: String) -> void:
	if new_text.is_valid_integer():
		if new_text == "0":
			new_text = "1"
			get_node('Buttons/Input').text = new_text
		UserData.ShopAdd = str2var(new_text)
