extends Node

var music_players = []
var index_pos

func _ready():
	randomize()
	music_players = get_children()
	pick_song()

func pick_song():
	var old_index = index_pos
	index_pos = randi() % 14
	#ensure new song
	while old_index == index_pos:
		index_pos = randi() % 14
	music_players[index_pos].play(0)
	music_players[index_pos].stream_paused = false

func _input(event):
	if event.is_action_pressed("skip_song"):
		music_players[index_pos].stream_paused = true
		pick_song()

func _on_AudioStreamPlayer_finished():
	pick_song()

