extends Control

var Price : int = 0

func _physics_process(delta: float) -> void:
	Price = UserData.ShopAdd * 500
	if UserData.Taps >= Price:
		get_node('Holder/Buttons/Price').modulate = Color.green
	if UserData.Taps < Price:
		get_node('Holder/Buttons/Price').modulate = Color.red
	get_node('Holder/Buttons/Price').text = "Price: " + var2str(Price)

func _on_Purchase_pressed() -> void:
	if UserData.Taps >= Price:
		UserData.Taps -= Price
		UserData.Chests += UserData.ShopAdd
