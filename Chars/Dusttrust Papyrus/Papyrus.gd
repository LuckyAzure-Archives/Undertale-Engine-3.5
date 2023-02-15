extends Position2D

var timer = 0

func _process(delta):
	timer += delta
	$Legs.scale.y = 1.05 - sin(timer * 2) * 0.05
	$Legs.scale.x = 0.95 + sin(timer * 2) * 0.05
	$Legs/Torso.scale.y = 2 - $Legs.scale.y
	$Legs/Torso.scale.x = 2 - $Legs.scale.x
	$Legs/Torso.rotation_degrees = 0 + sin(timer * 2) * 1
	$Legs/Torso/Head.rotation_degrees = -$Legs/Torso.rotation_degrees
