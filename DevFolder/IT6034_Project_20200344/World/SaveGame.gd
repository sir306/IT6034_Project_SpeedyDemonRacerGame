extends Node

var saved_data = {}
const SAVEGAME = "user://SaveGame.json"

func _ready():
	saved_data = get_saved_data()
	
func get_saved_data():
	var file = File.new()
	#check to see if file exists
	if not file.file_exists(SAVEGAME):
		#create save player name and car paint
		saved_data = {
		"Player_Name" : "Player1", 
		"Body_Color" : "ff0000",
		"Bonnet_Color" : "ff0000",
		"Boot_Color" : "ff0000",
		"Window_Color" : "152f2b2b",
		"Wheel_Color" : "000000",
		"Trim_Color" : "9d9d9d",
		"Current_Level" : "1",
		"master_vol" : -5,
		"music_vol" : -16,
		"sfx_vol" : -5
		}
		save_game()
	file.open(SAVEGAME, File.READ)
	var content = file.get_as_text()
	var data = parse_json(content)
	saved_data = data
	file.close()
	return data

func save_game():
	var save_game = File.new()
	save_game.open(SAVEGAME, File.WRITE)
	save_game.store_line(to_json(saved_data))
