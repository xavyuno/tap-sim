extends Control

func _ready() -> void:
	for a in UserData.Tappers:
		var Tap = preload('res://Game/Assets/Scenes/Tapper/Tapper.tscn').instance()
		Tap.position = Vector2(rand_range(25,1100), rand_range(15, 725))
		add_child(Tap)
	for a in UserData.GoldenTappers:
		var Tap = preload('res://Game/Assets/Scenes/Tapper/GoldenTapper.tscn').instance()
		Tap.position = Vector2(rand_range(25,1100), rand_range(15, 725))
		add_child(Tap)

func _physics_process(delta: float) -> void:
	if UserData.AddTapper == true:
		AddTappers()
		UserData.AddTapper = false
	if UserData.AddGoldenTappers == true:
		AddGoldenTapper()
		UserData.AddGoldenTappers = false

func AddTappers():
	for a in UserData.ShopAdd:
		var Tap = preload('res://Game/Assets/Scenes/Tapper/Tapper.tscn').instance()
		Tap.position = Vector2(rand_range(25,1100), rand_range(15, 725))
		add_child(Tap)

func AddGoldenTapper():
	for a in UserData.ShopAdd:
		var Tap = preload('res://Game/Assets/Scenes/Tapper/GoldenTapper.tscn').instance()
		Tap.position = Vector2(rand_range(25,1100), rand_range(15, 725))
		add_child(Tap)
