extends Label

var Success : bool = false
var input : String = ""

func _ready() -> void:
	input = get_parent().get_node('Holder').input
	
	if Success == true:
		text = "Code Success! [" + input + "]"
	else:
		text = "Code Invalid. [" + input + "]"

func _physics_process(delta: float) -> void:
	rect_position.y -= 2

func _on_Timer_timeout() -> void:
	queue_free()
