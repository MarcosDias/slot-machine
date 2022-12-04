extends Control

signal handle_pulled

onready var tween := $Tween
onready var handle := $Handle

func _on_Handle_pressed():
	tween.interpolate_property(handle, "rect_rotation", 0, -12, 0.2, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	tween.interpolate_property(handle, "rect_rotation", -12, 0, 0.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT, 0.65)
	tween.start()
	emit_signal("handle_pulled")
