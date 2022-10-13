extends KinematicBody2D

var pos = Vector2(320,240)
var angle = 0
var timer = 50
var lifetime = 50
var targeting = false
var target_to_heart = false
var target_to_pos = Vector2(0,0)
var changepos = Vector2(0,0)
var changeposshot = Vector2(0,0)

func _ready():
	$Charge.play()
	show()
	scrollerangle = angle + 360

var gasterspeed = 0
var active_hurtbox = 0

var scrollerangle = 0
var scroller = Vector2(-100,-100)

var lasersize = 1
var laser = 0
var scrollerlaser = 0

var move = 0
var timertemp = 9999

func _process(delta):
	visible = true
	timer -= 50 * delta
	scroller = scroller.linear_interpolate(pos, 8 * delta)
	scrollerangle = lerp(scrollerangle,angle, 8 * delta)
	rotation_degrees = scrollerangle
	if timer < 12 and 12 < timertemp:
		$"Gaster Blaster Sprite".frame = 1
		timertemp = 12
	if timer < 8 and 8 < timertemp:
		$"Gaster Blaster Sprite".frame = 2
		timertemp = 8
	if timer < 4 and 4 < timertemp:
		$"Gaster Blaster Sprite".frame = 3
		timertemp = 4
	if timer < 0 and 0 < timertemp: 
		timertemp = 0
		$Shot.play()
		$"Gaster Blaster Sprite".animation = "Shot"
		position = pos
		scrollerangle = angle
		rotation_degrees = angle
		gasterspeed = 100
		active_hurtbox = 1
	if timer > 0.9:
		position = scroller
		$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".scale.x = 0
		$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".scale.y = 10
		$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".visible = false
		scrollerlaser = 0.0
		laser = 1
	if timer < 0:
		position += changeposshot * delta
		rotation_degrees = angle
		if timer > (0 - lifetime):
			$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".scale.x = ((0.85) + (sin((timer + 10)* 0.40) *  0.15)) * scrollerlaser
			$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".visible = true
			scrollerlaser = lerp(scrollerlaser,laser, 20 * delta)
		if timer > -100:
			var _velocity = move_and_slide(Vector2(1, 0).rotated(rotation) * (0 - gasterspeed))
		if gasterspeed < 1200:
			gasterspeed += 5000 * delta
		match timer:
			0: scrollerlaser = $"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".scale.x
		if timer < (0 - lifetime):
			active_hurtbox = 0
			$"Gaster Blaster Sprite/Gaster Blaster Laser Sprite".scale.x = scrollerlaser
			laser = -0.1
			scrollerlaser = lerp(scrollerlaser,laser, 10 * delta) - (2 * delta)
		if timer < (0 - lifetime):
			if scrollerlaser < 0.02:
				$"Gaster Blaster Sprite".visible = 0
				if not get_node("Shot").playing:
					queue_free()
	match active_hurtbox:
		0: $"Gaster Blaster Sprite/Gaster Blaster Laser Sprite/Hurtbox/CollisionShape2D".disabled = 1
		1: $"Gaster Blaster Sprite/Gaster Blaster Laser Sprite/Hurtbox/CollisionShape2D".disabled = 0
