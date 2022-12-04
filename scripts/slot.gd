extends TextureRect

onready var row := $Row

const MOVE := 20
const TURN := -540

var time_interval := 0.025
var rng := RandomNumberGenerator.new()
var random_value := 0

func _ready() -> void:
	rng.randomize()
	owner.connect("handle_pulled", self, "_handle_pulled")

func _handle_pulled() -> void:
	random_value = 40 * rng.randi_range(2, 6)
	for i in random_value:
		if round(row.rect_position.y) >= 0:
			row.rect_position.y = TURN
		else:
			row.rect_position.y = round(row.rect_position.y) + MOVE
		
		yield(get_tree().create_timer(time_interval), "timeout")
	
	match(row.rect_position.y):
		0000.0: GameController.DIAMOND += 1
		-560.0: GameController.DIAMOND += 1
		-480.0: GameController.LIMON += 1
		-400.0: GameController.CHERRY += 1
		-320.0: GameController.SEVEN += 1
		-240.0: GameController.BAR += 1
		-160.0: GameController.WATERMELON += 1
		-080.0: GameController.CROWN += 1
		
	GameController.COUNTER_RUNNING += 1
	owner.luck()
