extends Panel

@onready var ResultLabel = $VBoxContainer/ResultLabel
@onready var OperandsLabel = $VBoxContainer/OperandsLabel
@onready var InputLine = $VBoxContainer/InputLine
@onready var InputRecord = $VBoxContainer/Label
var rng = RandomNumberGenerator.new()

func parse_command(input: String) -> void:
	rng.randomize()
	var result = dice_syntax.roll(input,rng)
	print(result)
	ResultLabel.text = str(int(result.result))

func roll(sides) -> void:
	rng.randomize()
	var result = rng.randi_range(1,sides)
	print(result)


func _on_input_line_text_submitted(new_text: String) -> void:
	parse_command(InputLine.text)
	InputRecord.text = InputLine.text
	InputLine.clear()
	pass # Replace with function body.
