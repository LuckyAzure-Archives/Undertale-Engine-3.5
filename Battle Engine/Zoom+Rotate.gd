extends Camera2D

var _pos = Vector2(320,240)
var _angle = 0
var _zoom = 1

var scroller_pos = Vector2(320,240)
var scroller_angle = 0
var scroller_zoom = 1

var scrollspeed = 0.1
var scrollerspeed = 0.1

var shake
var scrollershake = 0

func _process(delta):
	scroll(delta)
	positioning(delta)
	shake(delta)

func scroll(delta):
	scrollerspeed = lerp(scrollerspeed,scrollspeed,0.1 * (delta / 0.016667))
	scroller_pos = scroller_pos.linear_interpolate(_pos,scrollerspeed * (delta / 0.016667))
	scroller_angle = lerp(scroller_angle,_angle,scrollerspeed * (delta / 0.016667))
	scroller_zoom = lerp(scroller_zoom,_zoom,scrollerspeed * (delta / 0.016667))
	scrollershake = lerp(scrollershake,0,0.1 * (delta / 0.016667))

func positioning(delta):
	position.x = scroller_pos.x
	position.y = scroller_pos.y
	rotation_degrees = scroller_angle
	zoom = Vector2(scroller_zoom,scroller_zoom)

func shake(delta):
	position.x += int(rand_range(0 - scrollershake, scrollershake))
	position.y += int(rand_range(0 - scrollershake, scrollershake))
