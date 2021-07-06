extends Area

#var for type of pickup
var pickup_type


func pick_pickup():
	$AnimationPlayer.play("PickUpRotation")
	#random int to choose which pickup spawns
	randomize()
	var choose_pickup_num = randi() % 5
	#remove the scenes
	match choose_pickup_num:
		0:
			#bombpickup
			pickup_type = "bomb"
			$SpeedPickUp.visible = false
			$RepairPickUp.visible = false
			$TunnelCollapsePickUp.visible = false
			$TunnelFixPickUp.visible = false
		1:
			#speedpickup
			pickup_type = "speed"
			$BombPickup.visible = false
			$RepairPickUp.visible = false
			$TunnelCollapsePickUp.visible = false
			$TunnelFixPickUp.visible = false
		2:
			#repairpickup
			pickup_type = "repair"
			$BombPickup.visible = false
			$SpeedPickUp.visible = false
			$TunnelCollapsePickUp.visible = false
			$TunnelFixPickUp.visible = false
		3:
			#tunnelcollapsepickup
			pickup_type = "collapse tunnel"
			$BombPickup.visible = false
			$SpeedPickUp.visible = false
			$RepairPickUp.visible = false
			$TunnelFixPickUp.visible = false
		4:
			#tunnelfixpickup
			pickup_type = "fix tunnel"
			$BombPickup.visible = false
			$SpeedPickUp.visible = false
			$RepairPickUp.visible = false
			$TunnelCollapsePickUp.visible = false


func _on_PickUps_body_entered(_body):
	if pickup_type == "bomb":
		get_tree().call_group("player1", "explosion")
		queue_free()
	elif pickup_type == "repair":
		get_tree().call_group("player1", "repair")
		queue_free()
	elif pickup_type == "speed":
		get_tree().call_group("player1", "speed_boost")
		queue_free()
	elif pickup_type == "collapse tunnel":
		get_tree().call_group("gamestate", "reduce_shield_tunnel", true)
		queue_free()
	elif pickup_type == "fix tunnel":
		get_tree().call_group("gamestate", "repair_shield_tunnel", true)
		queue_free()
