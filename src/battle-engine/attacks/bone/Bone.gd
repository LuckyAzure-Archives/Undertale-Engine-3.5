extends KinematicBody2D

var pos = Vector2(320,240)
var size = 20
var angle = 0

var movepos = Vector2(2,0)
var movesize = 0
var moveangle = 0

var changepos = Vector2(0,0)
var changesize = 0
var changeangle = 0

var gotopos = Vector2(320,240)
var gotosize = 20
var gotoangle = 0

var timer = 0
var scrolltopos = false
var from = Vector2(0,0)
var fromsize = 0
var fromangle = 0

var maxsize = 50
var minsize = 10

var bounce = 0
var bouncespeed = 0

var scrollspeed = 0.05

var lifetime = 100

var type = ""

func _process(delta):
	if timer == 0:
		var rename
		match type:
			"":
				modulate = Color(1,1,1)
				rename = "Hurtbox"
			"blue":
				modulate = Color(0,1,1)
				rename = "HurtboxBlue"
			"orange":
				modulate = Color(1,0.65,0)
				rename = "HurtboxOrange"
		$"Bone Bottom/Hurtbox".name = rename
		$"Bone Bottom/Bone Middle/Hurtbox".name = rename
		$"Bone Bottom/Bone Middle/Bone Top/Hurtbox".name = rename
		$"Bone Bottom/Bone Middle".scale.y = size
		rotation_degrees = angle
		position = pos
	$"Bone Bottom/Bone Middle/Bone Top".scale.y = 1 / $"Bone Bottom/Bone Middle".scale.y
	timer += delta / 0.016667
	if timer > lifetime:
		queue_free()
	match scrolltopos:
		false:
			movepos += changepos * (delta / 0.016667)
			movesize += changesize * (delta / 0.016667)
			moveangle += changeangle * (delta / 0.016667)
			position += movepos * (delta / 0.016667)
			if not movesize == 0:
				$"Bone Bottom/Bone Middle".scale.y += movesize * (delta / 0.016667)
				if $"Bone Bottom/Bone Middle".scale.y < minsize:
					movesize = abs(movesize)
				if $"Bone Bottom/Bone Middle".scale.y > maxsize:
					movesize = 0 - movesize
			else:
				$"Bone Bottom/Bone Middle".scale.y = size + (sin(timer * bouncespeed) * bounce)
			rotation_degrees += moveangle * (delta / 0.016667)
		true:
			position = position.linear_interpolate(gotopos, (scrollspeed * (delta / 0.016667)))
			$"Bone Bottom/Bone Middle".scale.y += ((size + (sin(timer * bouncespeed) * bounce)) - $"Bone Bottom/Bone Middle".scale.y) * (scrollspeed * (delta / 0.016667))
			rotation_degrees = lerp(rotation_degrees,angle,(scrollspeed * (delta / 0.016667)))
