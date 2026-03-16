extends Node
#Game
var Name : String = "Tap Sim"
var Version = 1.5

var NewPlayer : bool = true
#World
var WorldMultiplier = 1

#Code
func _ready() -> void:
	GameSetup()
	SaveData.Load()

func GameSetup():
	OS.set_window_title(Name + " [ V" + str(Version) + " ]")
