extends Spatial

var beacons = []

func _ready():
	$GameOverPopUp.current_level = "1"
	$VictoryPopup.current_level = "1"
	beacons = get_tree().get_nodes_in_group("BeaconPos")
	beacons.pop_front()
	spawn_first_beacon()

func game_over():
	$VehicleBody/GameOver.show()
	#show popup and await input for user to decide restart or quit to main menu
	get_tree().paused = true
	yield(get_tree().create_timer(1.5), "timeout")
	get_tree().call_group("game_over", "game_over")
	$GameOverPopUp.show()
	

func reduce_shield_tunnel(collapse):
	if collapse:
		var tunnels = get_tree().get_nodes_in_group("tunnel")
		for tunnel in tunnels:
			tunnel.shrink = true
			tunnel.grow = false
			tunnel.shrink_tunnel()
			
func repair_shield_tunnel(repair):
	if repair:
		var tunnels = get_tree().get_nodes_in_group("tunnel")
		for tunnel in tunnels:
			tunnel.shrink = false
			tunnel.grow = true
			tunnel.grow_tunnel()

func spawn_first_beacon():
	var beacons = get_tree().get_nodes_in_group("BeaconPos")
	beacons[0].spawn_beacon()


func spawn_next_beacon():
	$VehicleBody/BeaconAudio.play(0)
	if beacons[0] != beacons[- 1]:
		beacons[0].spawn_beacon()
		beacons.pop_front()
	else:
		spawn_finish()

func victory():
	SaveGame.saved_data["Current_Level"] = "2"
	SaveGame.save_game()
	$VictoryPopup.show()
	get_tree().paused = true
	$VictoryPopup.game_ended = true
	
	

func spawn_finish():
	beacons[0].spawn_finish_line()
