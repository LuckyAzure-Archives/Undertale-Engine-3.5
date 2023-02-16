extends AnimatedSprite

var xspeed = rand_range(10, 50) * 0.1
var yspeed = rand_range(-50, -100) * 0.1

func _ready():
	match get_tree().get_current_scene().dir:
		0:
			xspeed = xspeed * 1
		1:
			xspeed = xspeed * -1
	position.x = get_tree().get_current_scene().get_node("Heart").position.x
	position.y = get_tree().get_current_scene().get_node("Heart").position.y

func _physics_process(delta):
	yspeed += 0.2
	position.y += yspeed
	position.x += xspeed
