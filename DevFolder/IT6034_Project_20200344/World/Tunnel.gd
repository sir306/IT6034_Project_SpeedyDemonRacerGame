extends CSGCylinder

var tunnel_size
var grow = false
var shrink = false

func _ready():
	tunnel_size = radius
	

func shrink_tunnel():
	if radius > 0 && shrink:
		radius -= 1
		$Timer.start()

func grow_tunnel():
	if radius < tunnel_size && grow:
		radius += 1
		$Timer2.start()

func _on_Timer_timeout():
	shrink_tunnel()
	
func _on_Timer2_timeout():
	grow_tunnel()
