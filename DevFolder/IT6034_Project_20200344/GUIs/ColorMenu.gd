extends Popup

func _ready():
	#declare vars for saved colors and retrieve them
	var body_color = SaveGame.saved_data["Body_Color"]	
	var bonnet_color = SaveGame.saved_data["Bonnet_Color"]
	var boot_color = SaveGame.saved_data["Boot_Color"]
	var window_color = SaveGame.saved_data["Window_Color"]
	var wheel_color = SaveGame.saved_data["Wheel_Color"]
	var trim_color = SaveGame.saved_data["Trim_Color"]
	#call func to set color pickers
	set_color_pickers(body_color, bonnet_color, boot_color, window_color, wheel_color, trim_color)

#func to set all pickers for loading and defaulting
func set_color_pickers(body, bonnet, boot, window, wheel, trim):
	$VBoxContainer/CenterContainer/GridContainer/BodyColor.color = Color(body)
	$VBoxContainer/CenterContainer/GridContainer/BonnetColor.color = Color(bonnet)
	$VBoxContainer/CenterContainer/GridContainer/BootColor.color = Color(boot)
	$VBoxContainer/CenterContainer/GridContainer/WindowColor.color = Color(window)
	$VBoxContainer/CenterContainer/GridContainer/WheelColor.color = Color(wheel)
	$VBoxContainer/CenterContainer/GridContainer/TrimColor.color = Color(trim)

func _on_CancelButton_pressed():
	hide()


func _on_SaveButton_pressed():
	#save game
	SaveGame.save_game()
	#close popup
	hide()


func _on_DefaultButton_pressed():
	#declare vars for saved colors and retrieve them and set them
	SaveGame.saved_data["Body_Color"] = "ff0000"
	var body_color = SaveGame.saved_data["Body_Color"]
	
	SaveGame.saved_data["Bonnet_Color"] = "ff0000"
	var bonnet_color = SaveGame.saved_data["Bonnet_Color"]
	
	SaveGame.saved_data["Boot_Color"] = "ff0000"
	var boot_color = SaveGame.saved_data["Boot_Color"]
	
	SaveGame.saved_data["Window_Color"] = "152f2b2b"
	var window_color = SaveGame.saved_data["Window_Color"]
	
	SaveGame.saved_data["Wheel_Color"] = "000000"
	var wheel_color = SaveGame.saved_data["Wheel_Color"]
	
	SaveGame.saved_data["Trim_Color"] = "9d9d9d"
	var trim_color = SaveGame.saved_data["Trim_Color"]
	
	#call func to set color pickers
	set_color_pickers(body_color, bonnet_color, boot_color, window_color, wheel_color, trim_color)


func _on_BodyColor_color_changed(color):
	SaveGame.saved_data["Body_Color"] = color.to_html()

func _on_WindowColor_color_changed(color):
	SaveGame.saved_data["Window_Color"] = color.to_html()

func _on_BonnetColor_color_changed(color):
	SaveGame.saved_data["Bonnet_Color"] = color.to_html()

func _on_BootColor_color_changed(color):
	SaveGame.saved_data["Boot_Color"] = color.to_html()

func _on_WheelColor_color_changed(color):
	SaveGame.saved_data["Wheel_Color"] = color.to_html()

func _on_TrimColor_color_changed(color):
	SaveGame.saved_data["Trim_Color"] = color.to_html()
