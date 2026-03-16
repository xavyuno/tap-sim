extends Control

var ChrismasDay : int
var ChrismasMonth : int
var Chrismas : bool = false

func _ready() -> void:
	ChrismasDay = OS.get_date().day
	ChrismasMonth = OS.get_date().month
	if ChrismasDay == 25 and ChrismasMonth == 12 or Chrismas == true:
		
		var Notification = preload('res://Game/Assets/Scenes/Notification/Notification.tscn').instance()
	
		Notification.Title = "Merry Christmas!"
		Notification.CloseFoot = false
		Notification.CloseHead = false
		Notification.Reward = 100
		Notification.RewardType = true
		Notification.AcceptText = "Thanks!"
		Notification.Info = "Here's 100 taps for free!"
	
		add_child(Notification)

		
		visible = true
	else:
		visible = false
