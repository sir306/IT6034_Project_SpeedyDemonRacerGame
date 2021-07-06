extends Popup


func _on_CloseButton_pressed():
	hide()


func _on_GamepadButton_pressed():
	$CenterContainer.hide()
	$CenterContainer2.show()


func _on_KeyBindingsButton_pressed():
	$CenterContainer2.hide()
	$CenterContainer.show()
