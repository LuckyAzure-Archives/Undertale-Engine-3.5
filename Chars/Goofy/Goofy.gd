extends Position2D

var timer = 0

func _process(delta):
	timer += delta * 1.5
	$Leftleg.scale.y = 1 - (sin(timer * 6) * 0.05)
	$Leftleg.rotation_degrees = (sin(timer * 3) * 2)
	$Rightleg.scale.y = 1 - (sin(timer * 6) * 0.05)
	$Rightleg.rotation_degrees = (sin(timer * 3) * 3)
	$Torso.position.x = -2 + (sin(timer * 3) * 2)
	$Torso.position.y = -28 + (sin(timer * 6) * 2)
	$Torso.rotation_degrees = (sin(timer * 3) * 1)
	$Torso/Leftarm0.rotation_degrees = (sin(timer * 3) * 2) + (sin((timer + 2) * 6) * -4)
	$Torso/Rightupperarm.rotation_degrees = (sin(timer * 3) * -2) + (sin((timer + 2) * 6) * 4)
	$Torso/Rightupperarm/Rightarm0.rotation_degrees = (sin(timer * 3) * -2) + (sin(timer * 6) * 2)
	$Torso/Head0.rotation_degrees = (sin((timer + 5) * 3) * 3)
