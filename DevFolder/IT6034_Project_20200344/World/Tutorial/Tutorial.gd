extends Spatial

var camera_selected
var unselect_camera

func _ready():
	pass


func play_car(car):
	match car:
		"Forwards":
			#start animation
			$ViewportContainer/Viewport/ForwardCar/AnimationPlayer.play("Forwards")
			#set to current
			camera_selected = $ViewportContainer/Viewport/ForwardCar/Camera
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"Backwards":
			#start animation
			$ViewportContainer/Viewport/ReverseCar/AnimationPlayer.play("Backwards")
			#set to current
			camera_selected = $ViewportContainer/Viewport/ReverseCar/Camera
			#unset current call
			unset_cameras("Forwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"LeftTurn":
			#start animation
			$ViewportContainer/Viewport/LeftTurnCar/AnimationPlayer.play("LeftTurn")
			#set to current
			camera_selected = $ViewportContainer/Viewport/LeftTurnCar/Camera
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("Forwards")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"RightTurn":
			#start animation
			$ViewportContainer/Viewport/RightTurnCar/AnimationPlayer.play("RightTurn")
			#set to current
			camera_selected = $ViewportContainer/Viewport/RightTurnCar/Camera
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("Forwards")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"RepairTunnel":
			camera_selected = $ViewportContainer/Viewport/RepairTunnelCar/Camera
			$ViewportContainer/Viewport/RepairTunnelCar/AnimationPlayer.play("RepairTunnelTut")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("Forwards")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"CollapseTunnel":
			camera_selected = $ViewportContainer/Viewport/CollapseCar/Camera
			$ViewportContainer/Viewport/CollapseCar/AnimationPlayer.play("CollapseTunnelTut")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("Forwards")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"RocketCar":
			camera_selected = $ViewportContainer/Viewport/RocketCar/Camera
			$ViewportContainer/Viewport/RocketCar/AnimationPlayer2.play("Rocket")
			$ViewportContainer/Viewport/RocketCar/PickUps/AnimationPlayer.play("PickUpRotation")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("Forwards")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"BeaconCar":
			camera_selected = $ViewportContainer/Viewport/BeaconCar/Camera
			$ViewportContainer/Viewport/BeaconCar/AnimationPlayer2.play("BeaconTut")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("Forwards")
			unset_cameras("ExplodeCar")
			unset_cameras("RepairCar")
			
		"ExplodeCar":
			camera_selected = $ViewportContainer/Viewport/ExplodeCar/Camera
			$ViewportContainer/Viewport/ExplodeCar/PickUps/AnimationPlayer.play("PickUpRotation")
			$ViewportContainer/Viewport/ExplodeCar/AnimationPlayer2.play("ExplodeTut")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("Forwards")
			unset_cameras("RepairCar")
			
		"RepairCar":
			camera_selected = $ViewportContainer/Viewport/RepairCar/Camera
			$ViewportContainer/Viewport/RepairCar/AnimationPlayer2.play("RepairCarTut")
			#unset current call
			unset_cameras("Backwards")
			unset_cameras("LeftTurn")
			unset_cameras("RightTurn")
			unset_cameras("RepairTunnel")
			unset_cameras("CollapseTunnel")
			unset_cameras("RocketCar")
			unset_cameras("BeaconCar")
			unset_cameras("ExplodeCar")
			unset_cameras("Forwards")
			
	camera_selected.current = true

func unset_cameras(car):
	match car:
		#unset to current
		"Forwards":
			unselect_camera = $ViewportContainer/Viewport/ForwardCar/Camera
			if $ViewportContainer/Viewport/ForwardCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/ForwardCar/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/ForwardCar/AnimationPlayer.stop(true)
			
		"Backwards":
			unselect_camera = $ViewportContainer/Viewport/ReverseCar/Camera
			if $ViewportContainer/Viewport/ReverseCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/ReverseCar/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/ReverseCar/AnimationPlayer.stop(true)
			
		"LeftTurn":
			unselect_camera = $ViewportContainer/Viewport/LeftTurnCar/Camera
			if $ViewportContainer/Viewport/LeftTurnCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/LeftTurnCar/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/LeftTurnCar/AnimationPlayer.stop(true)
			
		"RightTurn":
			unselect_camera = $ViewportContainer/Viewport/RightTurnCar/Camera
			if $ViewportContainer/Viewport/RightTurnCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/RightTurnCar/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/RightTurnCar/AnimationPlayer.stop(true)
			
		"RepairTunnel":
			unselect_camera = $ViewportContainer/Viewport/RepairTunnelCar/Camera
			if $ViewportContainer/Viewport/RepairTunnelCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/RepairTunnelCar/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/RepairTunnelCar/AnimationPlayer.stop(true)
			
		"CollapseTunnel":
			unselect_camera = $ViewportContainer/Viewport/CollapseCar/Camera
			if $ViewportContainer/Viewport/CollapseCar/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/CollapseCar/AnimationPlayer.seek(0,true)
				$ViewportContainer/Viewport/CollapseCar/AnimationPlayer.stop(true)
			
		"RocketCar":
			unselect_camera = $ViewportContainer/Viewport/RocketCar/Camera
			if $ViewportContainer/Viewport/RocketCar/AnimationPlayer2.is_playing():
				$ViewportContainer/Viewport/RocketCar/AnimationPlayer2.seek(0, true)
				$ViewportContainer/Viewport/RocketCar/AnimationPlayer2.stop(true)
				$ViewportContainer/Viewport/RocketCar/PickUps/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/RocketCar/PickUps/AnimationPlayer.stop(true)
			
		"BeaconCar":
			unselect_camera = $ViewportContainer/Viewport/BeaconCar/Camera
			if $ViewportContainer/Viewport/BeaconCar/AnimationPlayer2.is_playing():
				$ViewportContainer/Viewport/BeaconCar/AnimationPlayer2.seek(0, true)
				$ViewportContainer/Viewport/BeaconCar/AnimationPlayer2.stop(true)
			
		"ExplodeCar":
			unselect_camera = $ViewportContainer/Viewport/ExplodeCar/Camera
			if $ViewportContainer/Viewport/ExplodeCar/PickUps/AnimationPlayer.is_playing():
				$ViewportContainer/Viewport/ExplodeCar/PickUps/AnimationPlayer.seek(0, true)
				$ViewportContainer/Viewport/ExplodeCar/PickUps/AnimationPlayer.stop(true)
				$ViewportContainer/Viewport/ExplodeCar/AnimationPlayer2.seek(0, true)
				$ViewportContainer/Viewport/ExplodeCar/AnimationPlayer2.stop(true)
			
		"RepairCar":
			unselect_camera = $ViewportContainer/Viewport/RepairCar/Camera
			if $ViewportContainer/Viewport/RepairCar/AnimationPlayer2.is_playing():
				$ViewportContainer/Viewport/RepairCar/AnimationPlayer2.seek(0, true)
				$ViewportContainer/Viewport/RepairCar/AnimationPlayer2.stop(true)

	unselect_camera.current = false
