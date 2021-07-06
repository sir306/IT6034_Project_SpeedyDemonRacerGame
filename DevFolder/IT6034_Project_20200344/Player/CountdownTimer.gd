extends Sprite3D

var countdown = 30

func _ready():
	texture = $Viewport.get_texture()

func _physics_process(_delta):	
	if countdown == 14:
		$CountdownAudio.play(0)
	if countdown <= 12:
		$Viewport/Label.text = str(countdown)
		show()
	else:
		hide()

func new_countdown():
	countdown = 30
	$CountdownAudio.stop()
	$Timer.stop()
	$Timer.start()
	

func _on_Timer_timeout():
	countdown -= 1
