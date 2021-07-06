extends Popup

var page_num = 0
var page
var title
var text1 = ""
var text2 = ""

func _ready():
	set_camera(page_num)


func _on_NextButton_pressed():
	if page_num != 10:
		page_num += 1
	else:
		page_num = 0
	set_camera(page_num)


func _on_PreviousButton_pressed():
	if page_num != 0:
		page_num -= 1
	else:
		page_num = 10
	set_camera(page_num)

func _on_CloseButton_pressed():
	queue_free()
	

# warning-ignore:shadowed_variable
func set_camera(page_num):
	match page_num:
		0:
			page = "do not show"
			title = "Tutorial"
			text1 = ""
			text2 = ""
		1:
			page = "Forwards"
			title = "Going Forwards"
			text1 = "To go forwards hold down the W key or Right Trigger"
			text2 = "The car will loose speed as soon as you release the key or trigger"
		2:
			page = "Backwards"
			title = "Going Backwards"
			text1 = "To go backwards hold down the S key or Left Trigger"
			text2 = "Like going forwards you will slow down if you release the key or trigger"
		3:
			page = "LeftTurn"
			title = "Turning Left"
			text1 = "To turn left hold down the A key or move the Left Thumbstick to the left"
			text2 = "The car will only steer to the left if the car is moving forwards or backwards"
			
		4:
			page = "RightTurn"
			title = "Turning Right"
			text1 = "To turn right hold down the D key or move the Left Thumbstick to the right"
			text2 = "The car will only steer to the right if the car is moving forwards or backwards"
			
		5:
			page = "CollapseTunnel"
			title = "Tunnel Collapse Pickup"
			text1 = "This pickup known as the tunnel collapse is represented with a red shield. The tunnel collapse pickup shrinks the shield that keeps the lava off the track"
			text2 = "This happens over a few seconds and can make it impossible to get through or worse it can collapse on you!"
			
		6:
			page = "RepairTunnel"
			title = "Repair  Tunnel Pickup"
			text1 = "This pickup known as the repair tunnel is represneted with the same shield as the collapse tunnel except is a blue color"
			text2 = "The repair collapse tunnel will grow the shield that keeps the lava off the track to normal size but this can take a few seconds to return to normal size"
			
		7:
			page = "RocketCar"
			title = "Rocket Pickup"
			text1 = "This pickup known as the rocket pickup is represented by a rocket! If you pick this rocket up you will begin to travel at new top speed and accelerate even faster!"
			text2 = "But watch those corners! As you can roll off the edge and fall into the lava or even worse be stuck upside down and have to watch the timer run out!!"
			
		8:
			page = "BeaconCar"
			title = "Beacons"
			text1 = "This represents where you have to get to with your car and drive through. BEWARE! This may seem easy at first, but these beacons flash in different sizes"
			text2 = "If you miss the beacon you have to turn around and drive through it! Time is of the essence you have 30 seconds to reach each beacon! Some are easier to reach than others!"
			
		9:
			page = "ExplodeCar"
			title = "BOMBS!"
			text1 = "This game consists of BOMBS! They are represented with an actual bomb on the track"
			text2 = "Driving over a bomb is a bad idea in life and in this game. If you drive over one you will lose life! Drive over three bombs without a repair your car will blow up! Then its game over."
			
		10:
			page = "RepairCar"
			title = "Repair Pickup"
			text1 = "If you are unfortunate enough to drive over a bomb and lose health then you can pick up a spanner and fix your ride up! It takes two spanners for full health if you have driven over two bombs!"
			text2 = "But don't count on there being spanners in the game or after you have gone over a bomb, all pickups are random each round you play!!"
	
	$Title.text = title
	$Description1.text = text1
	$Description2.text = text2
	
	if page != "do not show":
		$FirstText.hide()
		$Description1.show()
		$Description2.show()
		$Tutorial/ViewportContainer.show()
		$Tutorial.play_car(page)
	else:
		$FirstText.show()
		$Description1.hide()
		$Description2.hide()
		$Tutorial/ViewportContainer.hide()
