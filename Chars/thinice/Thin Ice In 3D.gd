extends Position3D

var funni = 0

func _process(delta):
	funni += delta
	$Legs/Torso.rotation_degrees.x = 26 + sin(funni * 10) * 10
