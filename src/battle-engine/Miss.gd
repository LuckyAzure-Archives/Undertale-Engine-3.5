extends Sprite

var Anim = 0
var MissSpeed = 0

func _process(delta):
	modulate = Color(1,1,1, (200 - position.y) * 0.01)
	if Anim == 1:
		visible = 1
		position.y = 200
		rotation_degrees = -10
		Anim = 2
		MissSpeed = -500
	if Anim == 2:
		rotation_degrees += 35 * delta
		MissSpeed += 1000 * delta
		position.y += MissSpeed * delta
		if position.y > 480:
			Anim = 0
			visible = 1

func Miss():
	Anim = 1
