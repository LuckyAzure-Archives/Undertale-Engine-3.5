extends Position2D

var positions = [Vector2(),Vector2(),Vector2(),Vector2()]

func _ready():
	positions[0] = $Legs/Torso.position
	positions[1] = $Legs/Torso/Head.position
	positions[2] = $Legs/Torso/Left.position
	positions[3] = $Legs/Torso/Right.position

var timer = 0

func _process(delta):
	timer += 1 * delta
	$Legs/Torso.position.y = positions[0].y + sin(timer * 6) * 1
	$Legs/Torso.position.x = positions[0].x + sin(timer * 3) * 0.5
	$Legs/Torso/Head.position.y = positions[1].y + sin(timer * 6 + 0.25) * 0.5
	$Legs/Torso/Head.position.x = positions[1].x + sin(timer * 3 + 0.25) * 0.5
	$Legs/Torso/Left.position.y = positions[2].y + sin(timer * 6) * 0.5
	$Legs/Torso/Right.position.y = positions[3].y + sin(timer * 6) * 0.5
	$Legs/Torso/Left.rotation_degrees = sin(timer * 6 + 0.5) * -4
	$Legs/Torso/Right.rotation_degrees = sin(timer * 6 + 0.5) * 4
	$Legs/Torso.rotation_degrees = sin(timer * 3 + 0.75) * 1
	
	$Legs.material.set_shader_param("offset_0_0", Vector2(
	sin(timer * 3) * -1,
	sin(timer * 6) * -1
	))
	$Legs.material.set_shader_param("offset_1_0", Vector2(
	sin(timer * 3) * -1,
	sin(timer * 6) * -1
	))
