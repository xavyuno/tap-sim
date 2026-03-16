extends Node

const FILE : String = "user://User.data"
var NewFile = false
var Saving : bool = false

func Save():
	Saving = true
	#Temp Save Data
	var Data = {
		#Stats
		"Taps" : UserData.Taps,
		"Multiplier" : UserData.Multiplier,
		"Coins" : UserData.Coins,
		"Chests" : UserData.Chests,
		#Shop
		"MultiplierP" : UserData.MultiplierPrice,
		"CoinsUnlocked" : UserData.CoinsUnlocked,
		"Tappers" : UserData.Tappers,
		"GoldenTappers" : UserData.GoldenTappers,
		#Game
		"NewPlr" : Game.NewPlayer,
		#Settings
		"Sound" : Settings.Sound,
		"autoSave" : Settings.autoSave,
		"ShowTaps" : Settings.ShowTaps
	}

	var file = File.new()
	file.open(FILE, File.WRITE)
	file.store_var(Data)
	file.close()
	Saving = false

func Load():
	#Temp Save Data
	var Data = {
		#Stats
		"Taps" : UserData.Taps,
		"Multiplier" : UserData.Multiplier,
		"Coins" : UserData.Coins,
		"Chests" : UserData.Chests,
		#Shop
		"MultiplierP" : UserData.MultiplierPrice,
		"CoinsUnlocked" : UserData.CoinsUnlocked,
		"Tappers" : UserData.Tappers,
		"GoldenTappers" : UserData.GoldenTappers,
		#Game
		"NewPlr" : Game.NewPlayer,
		#Settings
		"Sound" : Settings.Sound,
		"autoSave" : Settings.autoSave,
		"ShowTaps" : Settings.ShowTaps
	}

	var file = File.new()
	if file.file_exists(FILE) and NewFile == false:
		file.open(FILE, File.READ)
		Data = file.get_var()
		file.close()
		#Make Saved Data
		#Stats
		UserData.Taps = Data.Taps
		UserData.Multiplier = Data.Multiplier
		UserData.Coins = Data.Coins
		UserData.Chests = Data.Chests
		#Shop
		UserData.MultiplierPrice = Data.MultiplierP
		UserData.CoinsUnlocked = Data.CoinsUnlocked
		UserData.Tappers = Data.Tappers
		UserData.GoldenTappers = Data.GoldenTappers
		#Game
		Game.NewPlayer = Data.NewPlr
		#Settings
		Settings.Sound = Data.Sound
		Settings.autoSave = Data.autoSave
		Settings.ShowTaps = Data.ShowTaps
	if NewFile == true:
		Save()
