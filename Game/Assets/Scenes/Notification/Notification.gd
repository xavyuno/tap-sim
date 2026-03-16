extends Control

var Title : String = ""
var CloseHead : bool = false

var Info : String = ""

var CloseFoot : bool = true
var CloseAccept : bool = true

var AcceptText : String = ""
var DeclineText : String = ""

var RewardType : bool = false
var Reward : int = 0

func _ready() -> void:
	Setup()

func Setup():
	rect_position = Vector2(480, 232)
	
	$Holder/Head/Title.text = Title
	$Holder/Head/Close.visible = CloseHead
	
	$Holder/Info.text = Info
	
	$Holder/Close/Decline.visible = CloseFoot
	$Holder/Close/Accept.visible = CloseAccept
	
	$Holder/Close/Accept.text = AcceptText
	$Holder/Close/Decline.text = DeclineText

func reward():
	UserData.Taps += Reward
	queue_free()

func Close():
	if RewardType == true:
		reward()
	
	
	
	queue_free()


func _on_Close_pressed() -> void:
	Close()


func _on_Accept_pressed() -> void:
	reward()


func _on_Decline_pressed() -> void:
	Close()
