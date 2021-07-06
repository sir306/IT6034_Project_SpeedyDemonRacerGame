extends Node

const MASTER_BUS = 0
const MUSIC_BUS = 1
const SFX_BUS = 2

func _ready():
	var master_vol = SaveGame.saved_data["master_vol"]
	var music_vol = SaveGame.saved_data["music_vol"]
	var sfx_vol = SaveGame.saved_data["sfx_vol"]
	
	AudioServer.set_bus_volume_db(MASTER_BUS, master_vol)
	AudioServer.set_bus_volume_db(MUSIC_BUS, music_vol)
	AudioServer.set_bus_volume_db(SFX_BUS, sfx_vol)

#update master audio bus
func update_master_vol(master_vol):
	AudioServer.set_bus_volume_db(MASTER_BUS, master_vol)
	SaveGame.saved_data["master_vol"] = master_vol
	SaveGame.save_game()	

#update music audio bus
func update_music_vol(music_vol):
	AudioServer.set_bus_volume_db(MUSIC_BUS, music_vol)
	SaveGame.saved_data["music_vol"] = music_vol
	SaveGame.save_game()

#update sfx audio bus
func update_sfx_vol(sfx_vol):
	AudioServer.set_bus_volume_db(SFX_BUS, sfx_vol)
	SaveGame.saved_data["sfx_vol"] = sfx_vol
	SaveGame.save_game()
