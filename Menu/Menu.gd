extends Node2D

var selection = 0
var Settings = false
var Settings_selection = 0

func _process(delta):
	animations(delta)
	if Input.is_action_just_pressed("Left") and selection > 0:
		selection -= 1
		$Select.play()
	if Input.is_action_just_pressed("Right") and selection < 2:
		selection += 1
		$Select.play()
	
	if Settings:
		if Input.is_action_just_pressed("Up"):
			Settings = false
		$Menu.volume_db = lerp($Menu.volume_db,-80,10 * delta)
		$MenuAlt.volume_db = lerp($MenuAlt.volume_db,0,30 * delta)
		$Cam.position.y = lerp($Cam.position.y,720,10 * delta)
	else:
		if Input.is_action_just_pressed("Down"):
			Settings = true
		$Menu.volume_db = lerp($Menu.volume_db,0,30 * delta)
		$MenuAlt.volume_db = lerp($MenuAlt.volume_db,-80,10 * delta)
		$Cam.position.y = lerp($Cam.position.y,240,10 * delta)

func animations(delta):
	$Selection.position.x = lerp($Selection.position.x, 320 + (-340 * selection), 10 * delta)
	match selection:
		0:
			$Text.text = "Dusttrust"
		1:
			$Text.text = "Dusttale"
		2:
			$Text.text = "???"
