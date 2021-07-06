extends Popup

func _ready():
	$VBoxContainer/MasterVolSlider.value = SaveGame.saved_data["master_vol"]
	$VBoxContainer/MusicVolSlider.value = SaveGame.saved_data["music_vol"]
	$VBoxContainer/SFXVolSlider.value = SaveGame.saved_data["sfx_vol"]


func _on_MasterVolSlider_value_changed(value):
	SoundControllers.update_master_vol(value)


func _on_SFXVolSlider_value_changed(value):
	SoundControllers.update_sfx_vol(value)


func _on_MusicVolSlider_value_changed(value):
	SoundControllers.update_music_vol(value)


func _on_DoneButton_pressed():
	hide()
