extends Position2D

var timer = 0
var globpos
var shake = Vector2(2,0)
var shakespeed = 50
var shakescroll = 5
var pos
var frame = 0
var sizescroll = 5

var armshake = 0

func _ready():
	globpos = position
	pos = [
		$Legs/Torso.position,
		$Legs/Torso/Head.position,
		$Legs/Torso/LeftArm.position,
		$Legs/Torso/RightArm.position
	]

func _process(delta):
	timer += 1 * delta
	armshake = lerp(armshake,0,5 * delta)
	shake = shake.linear_interpolate(Vector2(0,0),shakescroll * delta)
	scale = scale.linear_interpolate(Vector2(2,2),sizescroll * delta)
	position.x = globpos.x + (sin(timer * shakespeed) * shake.x)
	position.y = globpos.y + (sin(timer * shakespeed) * shake.y)
	$Legs/Torso/LeftArm.rotation_degrees = sin(timer * 2 - -0.50) * -4 + (sin(timer * 40) * armshake)
	$Legs/Torso/LeftArm.position.y = pos[2].y + sin(timer * 2) * 0.95
	$Legs/Torso/RightArm.rotation_degrees = sin(timer * 2 - -0.50) * 2 + (sin(timer * 40) * armshake)
	$Legs/Torso/RightArm.position.y = pos[3].y + sin(timer * 2) * 0.95
	$Legs/Torso.position.y = pos[3].y + sin(timer * 2) * 0.95
	$Legs/Torso/Head.position.y = pos[1].y + sin(timer * 2 - 0.75) * 0.95
	$Legs/Torso/Knot.rotation_degrees = sin(timer * 2 + 0.75) * 2
	$Legs/Torso/BackHoodie.scale.y = 1 + sin(timer * 2) * -0.05
	$Legs/Torso/BackHoodie.scale.x = 1 + sin(timer * 2.2 + 0.75) * -0.02
