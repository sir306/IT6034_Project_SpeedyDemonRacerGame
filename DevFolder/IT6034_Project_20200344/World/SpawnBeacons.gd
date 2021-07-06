extends Node

var has_spawned = false

func _ready():
	pass
	

func spawn_beacon():
	if !has_spawned:
		var beacon = preload("res://Assets/Beacons/Beacon.tscn").instance()
		add_child(beacon, true)
		has_spawned = true


func spawn_finish_line():
	var beacon = preload("res://Assets/Beacons/Beacon.tscn").instance()
	beacon.scale.z = 0.1
	beacon.last_beacon = true
	add_child(beacon, true)
