extends Position2D

var timer = 0

func _process(delta):
	timer += delta
	$Legs.scale.y = 1.05 - sin(timer * 2) * 0.05
	$Legs.scale.x = 0.995 + sin(timer * 2 - 0.1) * 0.005
	$Torso.position.y = -37 + sin(timer * 2 + 0.2) * 2
	$Torso.rotation_degrees = 0 + sin(timer * 2 + 0.2) * 1
	$Torso/Head.rotation_degrees = -$Torso.rotation_degrees
