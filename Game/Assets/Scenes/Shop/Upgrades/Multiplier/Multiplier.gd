extends Control

var PriceAdd : int = 0

func _physics_process(delta: float) -> void:
	if UserData.Taps >= UserData.MultiplierPrice:
		get_node('Holder/Buttons/Price').modulate = Color.green
	if UserData.Taps < UserData.MultiplierPrice:
		get_node('Holder/Buttons/Price').modulate = Color.red
	get_node('Holder/Buttons/Price').text = "Price: " + var2str(UserData.MultiplierPrice)

func _on_Purchase_pressed() -> void:
	if UserData.Taps >= UserData.MultiplierPrice:
		UserData.Taps -= UserData.MultiplierPrice
		UserData.Multiplier += UserData.ShopAdd
		if UserData.MultiplierPrice <= 250:
			PriceAdd += 100
		if UserData.MultiplierPrice >= 250:
			PriceAdd += 150
		if UserData.MultiplierPrice >= 500:
			PriceAdd += 200
		if UserData.MultiplierPrice >= 1000:
			PriceAdd += 250
		if UserData.MultiplierPrice >= 1500:
			PriceAdd += 550
		if UserData.MultiplierPrice >= 5000:
			PriceAdd += 1100
		if UserData.MultiplierPrice >= 15000:
			PriceAdd += 5500
		if UserData.MultiplierPrice >= 50000:
			PriceAdd += 15000
		UserData.MultiplierPrice += PriceAdd * UserData.ShopAdd
