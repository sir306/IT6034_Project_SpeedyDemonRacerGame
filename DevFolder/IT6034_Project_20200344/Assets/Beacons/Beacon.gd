extends Area


var last_beacon = false

func _ready():
	$BeaconMesh/AnimationPlayer2.play("PulseBeacon")
	$CollisionShape/AnimationPlayer.play("PulseBeacon")
	get_tree().call_group("player_countdown", "new_countdown")


func _on_Beacon_body_entered(_body):
	$Timer.stop()
	if !last_beacon:
		get_tree().call_group("gamestate", "spawn_next_beacon")
		queue_free()
	else:
		#cross finish line
		get_tree().call_group("gamestate", "victory")

func _on_Timer_timeout():
	#game over
	get_tree().call_group("gamestate", "game_over")
