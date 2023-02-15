extends Position2D

var timer = 0

func _process(delta):
	timer += delta
	scale.y = 2.05 + (sin(timer * 2) * 0.05)
	$Legs/Body.position.y = -23 - (sin(timer * 2 + 0.5) * 1)
	$Legs/Body.rotation_degrees = 0 - (sin(timer * 2 + 1) * 1)
	$Legs/Body/Face.position.y = -24 - (sin(timer * 2 + 0.5) * 0.5)
