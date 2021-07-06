extends VehicleBody

#audio variables
var accelerate_played = false
var not_started = true
#vehicle variables
var max_engine_force = 250

const MAX_STEER_ANGLE = 0.3

var steer_speed = 5.0
var steer_target = 0.0
var steer_angle = 0.0

const MAX_BRAKE_FORCE = 10.0

#exploded parts and health var an const for explosion val
var player_health = 100
var has_bonnet_exploded = false
var has_boot_exploded = false
const DAMAGE = 35

func _ready():
	#call func to set colors
	set_vehicle_colors()
	#play sounds


func _physics_process(delta):
	#seperated steering and engine force and brake to seperate functions to tidy up physics process
	engine_force = engine_power()
	apply_engine_sound(engine_force)
	steering = steer_direction(delta)
	brake = apply_brakes()
	if brake > 0:
		$CarLights/BreakLightLeft.show()
		$CarLights/BreakLightRight.show()
	else:
		$CarLights/BreakLightLeft.hide()
		$CarLights/BreakLightRight.hide()
		

#steering function
func steer_direction(delta):
	var steer_val = 0
	var left = Input.get_action_strength("left")
	var right = Input.get_action_strength("right")
	
	if left:
		steer_val = left
	if right:
		steer_val = -right
	
	steer_target = steer_val * MAX_STEER_ANGLE
	
	if steer_target < steer_angle:
		steer_angle -= steer_speed * delta
	elif steer_target > steer_angle:
		steer_angle += steer_speed * delta
	
	return steer_angle

#engine function
func engine_power():
	#throtle
	var throtle_input = Input.get_action_strength("forwards")
	throtle_input -= Input.get_action_strength("backwards")
	return throtle_input * max_engine_force

#brake function
func apply_brakes():
	var brakeVal = 0
	#braking
	var brake_input = Input.get_action_strength("brake")
	brakeVal = brake_input * MAX_BRAKE_FORCE
	return brakeVal

func set_vehicle_colors():
	#set body color
	var body = $Body
	var body_material = body.get_surface_material(0)
	var bodyColor = Color(SaveGame.saved_data["Body_Color"])
	body_material.albedo_color = bodyColor

	#set bonnet color
	var bonnet = $Body/Bonnet
	var bonnet_material = bonnet.get_surface_material(0)
	var bonnetColor = Color(SaveGame.saved_data["Bonnet_Color"])
	bonnet_material.albedo_color = bonnetColor
	
	#set window color
	var window = $Window
	var window_material = window.get_surface_material(0)
	var windowColor = Color(SaveGame.saved_data["Window_Color"])
	window_material.albedo_color = windowColor
	
	#set wheel color
	var wheel = $BackLeftWheel/BackLeftWheel
	var wheel_material = wheel.get_surface_material(0)
	var wheelColor = Color(SaveGame.saved_data["Wheel_Color"])
	wheel_material.albedo_color = wheelColor
	
	#set boot color
	var boot = $Body/BootHatch
	var boot_material = boot.get_surface_material(0)
	var bootColor = Color(SaveGame.saved_data["Boot_Color"])
	boot_material.albedo_color = bootColor

	#set trim color
	var trim = $FrontTrimDetail
	var trim_material = trim.get_surface_material(0)
	var trimColor = Color(SaveGame.saved_data["Trim_Color"])
	trim_material.albedo_color = trimColor

#speed boost
func speed_boost():
	max_engine_force = 300
	$SpeedPickUp.visible = true
	$RocketBoosterAudio.play(0)
	yield(get_tree().create_timer(10),"timeout")
	$SpeedPickUp.visible = false
	$RocketBoosterAudio.stop()
	max_engine_force = 250

func repair():
	$RepairCarAudio.play(0)
	if player_health < 100:
		player_health += DAMAGE
		$HealthBar/AnimationPlayer.play("HealthBar")
		$HealthBar/Viewport/TextureProgress.value = player_health
		if has_bonnet_exploded:
			$ExplodeBonnet.seek(0, true)
			$ExplodeBonnet.stop()
			has_bonnet_exploded = false
			if player_health == 100:
				$DamagedCarAudio.stop()
		else:
			$ExplodeBoot.seek(0, true)
			$ExplodeBoot.stop(true)
			has_boot_exploded = false
			if player_health == 100:
				$DamagedCarAudio.stop()
		

func explosion():
	#start damage audio
	$DamagedCarAudio.play(0)
	#var for random part removal ie boot vs bonnet
	randomize()
	var rand_num = randi() % 2
	$AnimationPlayer.play("BombExplode")
	player_health -= DAMAGE
	$HealthBar/AnimationPlayer.play("HealthBar")
	$HealthBar/Viewport/TextureProgress.value = player_health
	if player_health <= 0:
		#player dead
		$AnimationPlayer.play("ExplodeCar")
		get_tree().call_group("gamestate", "game_over")
	else:
		match rand_num:
			0:
				#boot exploded so explode bonnet
				if has_boot_exploded:
					$ExplodeBonnet.play("ExplodeBonnet")
					has_bonnet_exploded = true
				else:
					$ExplodeBoot.play("ExplodeBoot")
					has_boot_exploded = true
			1:
				#bonnet has exploded
				if has_bonnet_exploded:
					$ExplodeBoot.play("ExplodeBoot")
					has_boot_exploded = true
				else:
					$ExplodeBonnet.play("ExplodeBonnet")
					has_bonnet_exploded = true

#check to see if needs repair
func needs_repair():
	if player_health < 100:
		return true
	else:
		return false

#detect interaction with lavafloor collison layer
func _on_LavaCollisionArea_body_entered(_body):
	get_tree().call_group("gamestate", "game_over")

func _input(event):
	if event.is_action_pressed("forwards"):
		$AccelerateAudio.play()
		not_started = false

#adjust engine sound according to values
func apply_engine_sound(engine_force):
	if $AccelerateAudio.is_playing() == false && not_started != true:
		if $ConstantEngineAudio.is_playing() == false:
			$ConstantEngineAudio.play(0)
		if engine_force == 0:
			$ConstantEngineAudio.max_db = -24
		elif engine_force > 0 && engine_force <= 62:
			$ConstantEngineAudio.max_db = -21
		elif engine_force > 62 && engine_force <= 125:
			$ConstantEngineAudio.max_db = -18
		elif engine_force > 125 && engine_force <= 187:
			$ConstantEngineAudio.max_db = -15
		elif engine_force >= 187:
			$ConstantEngineAudio.max_db = -12
