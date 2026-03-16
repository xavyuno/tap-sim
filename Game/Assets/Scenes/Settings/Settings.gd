extends Control

var DRAG : bool = false

func _physics_process(delta: float) -> void:
	if DRAG == true:
		rect_position = get_global_mouse_position()

func _on_Drag_button_down() -> void:
	DRAG = true

func _on_Drag_button_up() -> void:
	DRAG = false

func _on_Close_pressed() -> void:
	visible = false
