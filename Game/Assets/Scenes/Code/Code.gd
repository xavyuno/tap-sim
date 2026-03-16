extends VBoxContainer

var input : String = ""
var text : String = ""

var Data = {
	#Codes
	"C1" : "freetaps",
	"C2" : "christmas",

	#Rewards
	"RC1" : 1000,
	"RC2" : 250,
		
	#Claimed
	"CC1" : false,
	"CC2" : false
}

var CleanData = {
	#Codes
	"C1" : "freetaps",
	"C2" : "christmas",

	#Rewards
	"RC1" : 100,
	"RC2" : 250,
		
	#Claimed
	"CC1" : false,
	"CC2" : false
}

func _ready() -> void:
	loadCodes()

func _physics_process(delta: float) -> void:
	if SaveData.NewFile == true:
		Data = CleanData


func saveCodes():
	var file = File.new()
	file.open("user://Codes.dat", File.WRITE)
	file.store_var(Data)
	file.close()


func loadCodes():
	var file = File.new()
	file.open("user://Codes.dat", File.READ)
	Data = file.get_var()
	file.close()
	return Data


func CodeData(Type : bool, Reward : int):
	var OutPut = preload('res://Game/Assets/Scenes/Code/CodeData.tscn').instance()
	OutPut.Success = Type
	UserData.Taps += Reward
	OutPut.rect_position = get_parent().get_node('Pos').position
	get_parent().add_child(OutPut)

func Code(data : String):
	input = data
	if data == Data.C1 and Data.CC1 == false:
		CodeData(true, Data.RC1)
		Data.CC1 = true
	elif data == Data.C2 and Data.CC2 == false:
		CodeData(true, Data.RC1)
		Data.CC1 = true
	else:
		CodeData(false, 0)
	saveCodes()

func _on_CodeInput_text_entered(new_text: String) -> void:
	ClearText("")
	Code(new_text.to_lower())

func _on_Accept_pressed() -> void:
	ClearText("")
	Code(text.to_lower())

func _on_CodeInput_text_changed(new_text: String) -> void:
	text = new_text.to_lower()

func ClearText(text : String):
	get_node('Buttons/CodeInput').text = text
