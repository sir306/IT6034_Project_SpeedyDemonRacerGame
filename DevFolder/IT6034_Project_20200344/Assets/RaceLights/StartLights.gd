extends Spatial

func _ready():
	start_race()
	get_tree().paused = true

func start_race():
	$Red_Lights/MeshInstance3/AnimationPlayer.play("StartLights")
	$Timer.start()
	

func _on_Timer_timeout():
	get_tree().paused = false
