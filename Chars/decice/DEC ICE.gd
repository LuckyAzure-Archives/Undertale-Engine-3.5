extends Position2D

var timer = 0

func _process(delta):
	timer += delta
	$Legs.rotation_degrees = sin(timer * 2 + 3) * 1
	$Legs.scale.y = 1.02 + sin(timer * 3) * 0.02
	
	$Legs/Torso.rotation_degrees = sin(timer * 2) * 4
	
	$Legs/Torso/LeftShoulder.rotation_degrees = sin(timer * 2 + 2) * -2
	$Legs/Torso/LeftShoulder/LeftArm.rotation_degrees = sin(timer * 2 + 3) * -2
	$Legs/Torso/LeftShoulder/LeftArm/LeftHand.rotation_degrees = sin(timer * 2 + 4) * -5
	
	$Legs/Torso/RightShoulder.rotation_degrees = sin(timer * 2 + 2) * 2
	$Legs/Torso/RightShoulder/RightArm.rotation_degrees = sin(timer * 2 + 3) * 2
	$Legs/Torso/RightShoulder/RightArm/RightHand.rotation_degrees = sin(timer * 2 + 4) * 5
	
	$Legs/Torso/DownHead.rotation_degrees = sin(timer * 2 + 3) * 2
	$Legs/Torso/DownHead/UpHead.rotation_degrees = sin(timer * 2 + 3) * 2
