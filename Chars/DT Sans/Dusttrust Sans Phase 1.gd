extends KinematicBody2D

var anim_poses = 0
var time = 0
var shake = 0

func _physics_process(delta):
	match anim_poses:
		-1:
			$torsodown/torso/head.frame = 2
			time += 0.005
			shake = 0
			$"torsodown/torso/LeftArm1/LeftArm2".frame = 1
			$"torsodown/torso/RightArm1/RightArm2".frame = 1
			$"torsodown".rotation_degrees = sin(time * 4) * 0
			$"torsodown/torso/head".rotation_degrees = 0
			$"legs".scale.y = 1 + sin((time + 0.1) * 5) * -0.05
			$"torsodown".position.y = $"legs".position.y - ($"legs".scale.y * 30)
			$"torsodown/torso/LeftArm1".rotation_degrees = sin(time * 5) * (-5 - shake)
			$"torsodown/torso/LeftArm1/LeftArm2".rotation_degrees = sin((time + 0.2) * -5) * (8 - shake)
			$"torsodown/torso/RightArm1".rotation_degrees = sin(time * 5) * (5 + shake)
			$"torsodown/torso/RightArm1/RightArm2".rotation_degrees = sin((time + 0.2) * -5) * (-8 + shake)
			$"torsodown/torso/head/lefteye".modulate = Color(1, 1, 1, 0)
			$"torsodown/torso/head/righteye".modulate = Color(1, 1, 1, 0)
			$"torsodown/torsoend".rotation_degrees = sin(time * 3) * 0
			$"torsodown/torso/LeftArm1/LeftArm2/Particles2D".visible = 0
			$"torsodown/torso/RightArm1/RightArm2/Particles2D".visible = 0
		0:
			$torsodown/torso/head.frame = 0
			time += 0.01
			shake = sin(time * 100) * 1
			$"torsodown".rotation_degrees = sin(time * 4) * -0.5
			$"torsodown/torso/head".rotation_degrees = sin(time * 5) * (-2 - shake)
			$"legs".scale.y = 1 + sin((time + 0.1) * 5) * -0.05
			$"torsodown".position.y = $"legs".position.y - ($"legs".scale.y * 30)
			$"torsodown/torso/LeftArm1".rotation_degrees = sin(time * 5) * (-5 - shake)
			$"torsodown/torso/LeftArm1/LeftArm2".rotation_degrees = sin((time + 0.1) * 5) * (8 - shake)
			$"torsodown/torso/RightArm1".rotation_degrees = sin(time * 5) * (5 + shake)
			$"torsodown/torso/RightArm1/RightArm2".rotation_degrees = sin((time + 0.1) * 5) * (-8 + shake)
			$"torsodown/torso/head/lefteye".modulate = Color(1, 1, 1, 0.75+ sin((time + 0.2) * 8) * 0.5)
			$"torsodown/torso/head/righteye".modulate = Color(1, 1, 1, 0.75+ sin((time + 0.2) * 6) * -0.5)
			$"torsodown/torsoend".rotation_degrees = sin(time * 3) * -5
			$"torsodown/torso/LeftArm1/LeftArm2/Particles2D".visible = 1
			$"torsodown/torso/RightArm1/RightArm2/Particles2D".visible = 1
		1:
			$torsodown/torso/head.frame = 1
			time += 0.01
			shake = 0
			$"torsodown".rotation_degrees = sin(time * 4) * -0.5
			$"torsodown/torso/head".rotation_degrees = sin(time * 5) * (-2 - shake)
			$"legs".scale.y = 1 + sin((time + 0.1) * 5) * -0.05
			$"torsodown".position.y = $"legs".position.y - ($"legs".scale.y * 30)
			$"torsodown/torso/LeftArm1".rotation_degrees = sin(time * 5) * (-5 - shake)
			$"torsodown/torso/LeftArm1/LeftArm2".rotation_degrees = sin((time + 0.1) * 5) * (8 - shake)
			$"torsodown/torso/RightArm1".rotation_degrees = sin(time * 5) * (5 + shake)
			$"torsodown/torso/RightArm1/RightArm2".rotation_degrees = sin((time + 0.1) * 5) * (-8 + shake)
			$"torsodown/torso/head/lefteye".modulate = Color(1, 1, 1, 0)
			$"torsodown/torso/head/righteye".modulate = Color(1, 1, 1, 0)
			$"torsodown/torsoend".rotation_degrees = sin(time * 3) * -5
