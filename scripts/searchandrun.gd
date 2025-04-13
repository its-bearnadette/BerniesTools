extends LineEdit

@onready var OperandsLabel = $Diceroller/VBoxContainer/OperandsLabel
@onready var ResultLabel = $Diceroller/VBoxContainer/ResultLabel
@onready var CommandRecall = $Diceroller/VBoxContainer/CommandRecall
var rng = RandomNumberGenerator.new()
# model after rofi



# Commands
# !help
# !roll [pass off to dice syntax]
# !make [note, clock, turntracker, hexmap]
# ?[query any tag]
# recognize any math expression and return an answer.

func help():
	# List of commands!
	# Also offer some advice on shortcuts.
	pass

func make():
	# Create a new instance of one of the available applets. Maybe make this program work modularly enough to launch whatever gets added.
	pass

func roll(input):
	rng.randomize()
	var result_string = dice_syntax.roll(input,rng)
	var rolls = result_string.rolls[0]
	var dice = rolls["dice"]
	$Diceroller.visible = true
	ResultLabel.text = str(int(result_string.result))
	print(result_string.result)
	OperandsLabel.text = str(dice)


func query():
	# Search tags in stored content.
	pass

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text.begins_with("!help"):
		print("Enter a mathematical expression to parse, enter a search query for an item from your notes, or something else lol.")
		pass
	if new_text.begins_with("!roll"):
		var input = new_text.lstrip("!roll ")
		roll(input)
		CommandRecall.text = input
		text = ""
		pass
	if new_text.begins_with("!note"):
		$"../.."._on_add_note_pressed()

	if new_text.begins_with("!clock"):
		$"../.."._on_add_clock_pressed()
	
	if new_text.begins_with("!table"):
		print("work in progress!")
		pass
	clear()
