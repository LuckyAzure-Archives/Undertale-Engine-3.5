extends KinematicBody2D

var pos = Vector2(320,320)
var battlepos = Vector2(320,320)
var scroller = Vector2(320,320)

var size = Vector2(564,130)
var battlesize = Vector2(130,130)
var scrollersize = Vector2(564,130)

var angle = 0
var battleangle = 0
var scrollerangle = 0

var scrollspeed = 0.1
var scrollerspeed = 0.1

func _ready():
	match Battle.steps:
		0: 
			scroller = Vector2(320,320)
			scrollersize = Vector2(564,130)

var boxshake = 20
var boxshakespeed = 20
var timer = 0

func draw_lines():
	var posi = scrollersize + Vector2(5,5)
	
	$Line.set_point_position(0,posi * -0.5)
	$Line.set_point_position(1,Vector2(posi.x * 0.5,posi.y * -0.5))
	$Line.set_point_position(2,posi * 0.5)
	$Line.set_point_position(3,Vector2(posi.x * -0.5,posi.y * 0.5))
	$Line.set_point_position(4,posi * -0.5)
	$Line.set_point_position(5,Vector2(posi.x * 0.5,posi.y * -0.5))

func _process(delta):
	draw_lines()
	timer += 20 * delta
	if boxshake > 0.2:
		boxshake = lerp(boxshake,0,boxshakespeed * delta)
	else:
		boxshake = 0
	scrollerspeed = lerp(scrollerspeed,scrollspeed,5 * delta)
	scroller = scroller.linear_interpolate(pos, scrollerspeed * 50 * delta)
	scrollersize = scrollersize.linear_interpolate(size, scrollerspeed * 50 * delta)
	scrollerangle = lerp(scrollerangle,angle,scrollerspeed * 50 * delta)
	match Battle.steps:
		0: 
			pos = Vector2(320,320)
			size = Vector2(564,130)
			angle = 0
		0.5: 
			pos = battlepos
			size = battlesize
			angle = battleangle
		1: 
			pos = battlepos
			size = battlesize
			angle = battleangle
	$BlackBackground.margin_left = (scrollersize.x * -0.5) - 8
	$BlackBackground.margin_top = (scrollersize.y * -0.5) - 8
	$BlackBackground.margin_bottom = (scrollersize.y * 0.5) + 9
	$BlackBackground.margin_right = (scrollersize.x * 0.5) + 9
	position = scroller
	$LeftWall.scale.y = scrollersize.y
	$LeftWall.position.x = (scrollersize.x * -0.5)
	$RightWall.scale.y = scrollersize.y
	$RightWall.position.x = (scrollersize.x * 0.5)
	$UpWall.scale.x = scrollersize.x
	$UpWall.position.y = (scrollersize.y * -0.5)
	$DownWall.scale.x = scrollersize.x
	$DownWall.position.y = (scrollersize.y * 0.5)
	rotation_degrees = scrollerangle + (sin(timer) * boxshake)
