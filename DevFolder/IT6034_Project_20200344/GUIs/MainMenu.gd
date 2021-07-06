extends Control

onready var current_level_text = $VBoxContainer/CenterContainer/GridContainer/LineEdit
onready var current_level = SaveGame.saved_data["Current_Level"]
#var for storing the level that will be played
var load_level


func _ready():
	var player_name_box = $VBoxContainer/CenterContainer/GridContainer/PlayerNameEdit
	var player_name = SaveGame.saved_data["Player_Name"]
	player_name_box.text = player_name
	current_level_text.text = current_level
	# warning-ignore:return_value_discarded
	get_node("Level Select").connect("level_change", self, "_level_select_change")

func _on_EditColorsButton_pressed():
	$ColorMenu.show()


func _on_PlayerNameEdit_text_changed(new_text):
	SaveGame.saved_data["Player_Name"] = new_text
	SaveGame.save_game()


func _on_PlayButton_pressed():
	if int(current_level_text.text) >= 3:
		$LevelNotMadeMsg.show()
		yield(get_tree().create_timer(5), "timeout")
		$LevelNotMadeMsg.hide()
	else:
		match_level_to_scene()
		# warning-ignore:return_value_discarded
		get_tree().change_scene_to(load_level)


func _on_ControlsButton_pressed():
	$Control_Instructions.show()


func _on_QuitGame_pressed():
	get_tree().quit()


func _on_Tutorial_pressed():
	var pop = preload("res://World/Tutorial/TutorialPopup.tscn").instance()
	add_child(pop)
	pop.show()

func _on_SelectLevelButton_pressed():
	$"Level Select".show()

func _level_select_change(level):
	current_level_text.text = level


func match_level_to_scene():
	
	match current_level_text.text:
		"1":
			load_level = load("res://World/Level_1.tscn")
		"2":
			load_level = load("res://World/Level_2.tscn")
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


func _on_AudioSettingButton_pressed():
	$SoundMenu.show()
