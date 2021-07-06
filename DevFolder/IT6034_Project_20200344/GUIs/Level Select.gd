extends Popup

var level1 = "Level1"
var level2 ="Level2"
onready var no_level_msg = $LevelNotMadeMsg2
onready var level_buttons = get_tree().get_nodes_in_group("level_buttons")

signal level_change(level)

func _ready():
	set_available_levels()

func _on_level_button_pressed(button_text):
	print(button_text)
	match button_text:
		#level 1
		level1:
			emit_signal("level_change", "1")
		#level 2
		level2:
			emit_signal("level_change", "2")
		#levels havent been created
		_:
			no_level_msg.show()
			yield(get_tree().create_timer(4) , "timeout")
			no_level_msg.hide()


func _on_CloseButton_pressed():
	hide()


func set_available_levels():
	var current_level = int(SaveGame.saved_data["Current_Level"])
	#match statement to enable correct level buttons
	match current_level:
		#level 1 will always be available by defaults so only enable the rest
		2:
			var levels = level_buttons.slice(0,1)
			for button in levels:
				button.disabled = false
		3:
			var levels = level_buttons.slice(0,2)
			for button in levels:
				button.disabled = false
		4:
			var levels = level_buttons.slice(0,3)
			for button in levels:
				button.disabled = false
		5:
			var levels = level_buttons.slice(0,4)
			for button in levels:
				button.disabled = false
		6:
			var levels = level_buttons.slice(0,5)
			for button in levels:
				button.disabled = false
		7:
			var levels = level_buttons.slice(0,6)
			for button in levels:
				button.disabled = false
		8:
			var levels = level_buttons.slice(0,7)
			for button in levels:
				button.disabled = false
		9:
			var levels = level_buttons.slice(0,8)
			for button in levels:
				button.disabled = false
		10:
			var levels = level_buttons.slice(0,9)
			for button in levels:
				button.disabled = false
		11:
			var levels = level_buttons.slice(0,10)
			for button in levels:
				button.disabled = false
		12:
			var levels = level_buttons.slice(0,11)
			for button in levels:
				button.disabled = false
