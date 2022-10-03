extends KinematicBody2D

var pos = Vector2(320,320)
var battlepos = Vector2(320,320)
var scroller = Vector2(320,320)

var size = Vector2(563,125)
var battlesize = Vector2(125,125)
var scrollersize = Vector2(563,125)

var angle = 0
var battleangle = 0
var scrollerangle = 0

var scrollspeed = 0.1
var scrollerspeed = 0.1

func _ready():
	match get_parent().get_parent().Battle:
		0: 
			scroller = Vector2(320,320)
			scrollersize = Vector2(563,125)

func _process(delta):
	scrollerspeed = lerp(scrollerspeed,scrollspeed,5 * delta)
	scroller = scroller.linear_interpolate(pos, scrollerspeed * 50 * delta)
	scrollersize = scrollersize.linear_interpolate(size, scrollerspeed * 50 * delta)
	scrollerangle = lerp(scrollerangle,angle,scrollerspeed * 50 * delta)
	match get_parent().get_parent().Battle:
		0: 
			pos = Vector2(320,320)
			size = Vector2(563,125)
			angle = 0
		0.5: 
			pos = battlepos
			size = battlesize
			angle = battleangle
		1: 
			pos = battlepos
			size = battlesize
			angle = battleangle
	$BlackBackground.scale.x = (scrollersize.x * -1) - 16
	$BlackBackground.scale.y = (scrollersize.y * -1) - 16
	position = scroller
	$LeftWall.scale.y = scrollersize.y
	$LeftWall.position.x = (scrollersize.x * -0.5)
	$"UpLeft Corner".position.x = (scrollersize.x * -0.5) - 2.5
	$"UpLeft Corner".position.y = (scrollersize.y * -0.5) - 2.5
	$"DownLeft Corner".position.x = (scrollersize.x * -0.5) - 2.5
	$"DownLeft Corner".position.y = (scrollersize.y * 0.5) + 2.5
	$RightWall.scale.y = scrollersize.y
	$RightWall.position.x = (scrollersize.x * 0.5)
	$"UpRight Corner".position.x = (scrollersize.x * 0.5) + 2.5
	$"UpRight Corner".position.y = (scrollersize.y * -0.5) - 2.5
	$"DownRight Corner".position.x = (scrollersize.x * 0.5) + 2.5
	$"DownRight Corner".position.y = (scrollersize.y * 0.5) + 2.5
	$UpWall.scale.x = scrollersize.x
	$UpWall.position.y = (scrollersize.y * -0.5)
	$DownWall.scale.x = scrollersize.x
	$DownWall.position.y = (scrollersize.y * 0.5)
	rotation_degrees = scrollerangle
