extends Control

var Price : int = 5

func _physics_process(delta: float) -> void:
	if UserData.CoinsUnlocked == true:
		get_node('Holder/Buttons/Price').modulate = Color.green
		get_node('Holder/Buttons/Purchase').text = "Purchased"
		get_node('Holder/Buttons/Purchase').disabled = true
	if UserData.Taps >= Price and UserData.CoinsUnlocked == false:
		get_node('Holder/Buttons/Price').modulate = Color.green
	if UserData.Taps < Price and UserData.CoinsUnlocked == false:
		get_node('Holder/Buttons/Price').modulate = Color.red
	get_node('Holder/Buttons/Price').text = "Price: " + var2str(Price)

func _on_Purchase_pressed() -> void:
	if UserData.Taps >= Price and UserData.CoinsUnlocked == false:
		UserData.Taps -= Price
		UserData.CoinsUnlocked = true
