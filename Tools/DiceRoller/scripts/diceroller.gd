extends Panel

@onready var ResultLabel = $VBoxContainer/ResultLabel
@onready var OperandsLabel = $VBoxContainer/OperandsLabel
@onready var InputRecord = $VBoxContainer/LineRecord
@onready var InputLine = $VBoxContainer/InputLine
var rng = RandomNumberGenerator.new()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up"):
		InputLine.text = InputRecord.text

func parse_command(input: String) -> void:
	rng.randomize()
	var result = dice_syntax.roll(input,rng)
	var rolls = result.rolls[0]
	var dice = rolls["dice"]
	OperandsLabel.text = str(dice)
	ResultLabel.text = str(int(result.result))



func _on_input_line_text_submitted(new_text: String) -> void:
	parse_command(InputLine.text)
	InputRecord.text = InputLine.text
	InputLine.clear()
	pass # Replace with function body.
