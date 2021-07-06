extends Area

var has_spawned = false

func spawn_pickups():
	if !has_spawned:
		var pickups_scene = preload("res://Assets/PickUps/PickUps.tscn").instance()
		pickups_scene.translation = Vector3($Position3D.translation.x, $Position3D.translation.y, $Position3D.translation.z)
		pickups_scene.pick_pickup()
		add_child(pickups_scene, true)
		has_spawned = true



func _on_PickupSpawn_body_entered(_body):
	spawn_pickups()
