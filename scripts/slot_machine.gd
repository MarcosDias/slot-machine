extends Control

signal handle_pulled

onready var tween := $Tween
onready var handle := $Handle
onready var winner := $Winner

func _on_Handle_pressed():
	tween.interpolate_property(handle, "rect_rotation", 0, -12, 0.2, Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	tween.interpolate_property(handle, "rect_rotation", -12, 0, 0.5, Tween.TRANS_BOUNCE, Tween.EASE_OUT, 0.65)
	tween.start()
	emit_signal("handle_pulled")
	winner.hide()
	handle.disabled = true
	GameController.reset_points()

func luck() -> void:
	if GameController.COUNTER_RUNNING < 3:
		return
	
	handle.disabled = false
	
	if GameController.DIAMOND == 2:
		has_winner(100)
	elif GameController.DIAMOND == 3:
		has_winner(200)
	if GameController.CROWN == 2:
		has_winner(300)
	elif GameController.CROWN == 3:
		has_winner(400)
	if GameController.WATERMELON == 2:
		has_winner(500)
	elif GameController.WATERMELON == 3:
		has_winner(600)
	if GameController.BAR == 2:
		has_winner(700)
	elif GameController.BAR == 3:
		has_winner(800)
	if GameController.SEVEN == 2:
		has_winner(1000)
	elif GameController.SEVEN == 3:
		has_winner(1500)
	if GameController.CHERRY == 2:
		has_winner(2000)
	elif GameController.CHERRY == 3:
		has_winner(3000)
	if GameController.LIMON == 2:
		has_winner(4000)
	elif GameController.LIMON == 3:
		has_winner(5000)

func has_winner(value: int) -> void:
	winner.text = str("Você Ganhou: ", value)
	winner.show()
