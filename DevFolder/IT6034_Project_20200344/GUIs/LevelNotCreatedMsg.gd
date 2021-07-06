extends Popup

func _input(event):
	if event.is_action_pressed("continue"):
		var mainMenu = load("res://GUIs/MainMenu.tscn")
		get_tree().change_scene_to(mainMenu)
