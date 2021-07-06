extends Sprite3D

var game_paused = false

func _ready():
	texture = $Viewport.get_texture()

func _input(event):
	if game_paused == true:
		if event.is_action_pressed("continue"):
			game_paused = false
			get_tree().paused = false
			hide()
		elif event.is_action_pressed("quit"):
			var menu = load("res://GUIs/MainMenu.tscn")
			get_tree().paused = false
			# warning-ignore:return_value_discarded
			get_tree().change_scene_to(menu)
		elif event.is_action_pressed("sound"):
			var sound = get_tree().get_nodes_in_group("SoundMenu")
			sound[0].show()
	else:
		if event.is_action_pressed("pause"):
			show()
			game_paused = true
			get_tree().paused = true
