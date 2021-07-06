extends AudioStreamPlayer

var music_list = []

func _ready():
	get_all_music()
	pick_song()

func _input(event):
	if event.is_action_pressed("skip_song"):
		pick_song()

func get_all_music():
	var dir = Directory.new()
	dir.open("res://Assets/Music/")
	dir.list_dir_begin()
	
	while true:
		var file = dir.get_next()
		if file == "":
			#no more files
			break
		elif not file.begins_with(".") && !file.ends_with(".import"):
			music_list.append(load("res://Assets/Music/" + file))
	
	dir.list_dir_end()
	
func pick_song():
	randomize()
	var list_len = music_list.size()
	var i = randi() % (list_len - 1)
	stream = music_list[i]
	play(0)


func _on_MusicPlayer_finished():
	pick_song()

