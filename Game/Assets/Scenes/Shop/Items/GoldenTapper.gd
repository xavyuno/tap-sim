extends Control

var Price : int = 0

func _physics_process(delta: float) -> void:
	Price = UserData.ShopAdd * 900
	if UserData.GoldenTappers == 5:
		get_node('Holder/Buttons/Purchase').text = "Limit Reached"
		get_node('Holder/Buttons/Purchase').disabled = true
		get_node('Holder/Buttons/Price').modulate = Color.green
	else:
		get_node('Holder/Buttons/Purchase').text = "Buy"
		get_node('Holder/Buttons/Purchase').disabled = false
	if UserData.Taps >= Price:
		get_node('Holder/Buttons/Price').modulate = Color.green
	if UserData.Taps < Price:
		get_node('Holder/Buttons/Price').modulate = Color.red
	get_node('Holder/Buttons/Price').text = "Price: " + var2str(Price)

func _on_Purchase_pressed() -> void:
	if UserData.Taps >= Price and UserData.GoldenTappers < 5 and UserData.ShopAdd * UserData.GoldenTappers < 5:
		UserData.Taps -= Price
		UserData.GoldenTappers += UserData.ShopAdd
		UserData.AddGoldenTappers = true
