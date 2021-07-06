extends Popup

var game_ended = false

var load_level
var current_level

var enter_or_esc_key

func _ready():
	pass

func _process(_delta):
	if game_ended:
		match enter_or_esc_key:
			"enter":
				match_level_to_scene()
				# warning-ignore:return_value_discarded
				get_tree().change_scene_to(load_level)
				get_tree().paused = false
			"esc":
				var scene = load("res://GUIs/MainMenu.tscn")
				# warning-ignore:return_value_discarded
				get_tree().change_scene_to(scene)
				get_tree().paused = false
	

func game_over():
	game_ended = true

func _input(event):
	#will only do something if game has ended
	if game_ended:
		if event.is_action_pressed("ESC_quit"):
			enter_or_esc_key = "esc"
		elif event.is_action_pressed("continue"):
			enter_or_esc_key = "enter"

func match_level_to_scene():
	
	match current_level:
		"1":
			load_level = load("res://World/Level_2.tscn")
		"2":
			#load demo over
			load_level = load("res://GUIs/LevelNotCreatedMsg.tscn")
		#match values below are dead code as the levels do not yet exist but the blocks 
		#for implementing them do
		"3":
			pass
		"4":
			pass
		"5":
			pass
		"6":
			pass
		"7":
			pass
		"8":
			pass
		"9":
			pass
		"10":
			pass
		"11":
			pass
		"12":
			pass
