extends Sprite

var Miss = 0
var MissSpeed = 0

func _physics_process(delta):
	modulate = Color(1,1,1, (200 - position.y) * 0.01)
	if Miss == 1:
		visible = 1
		position.y = 200
		rotation_degrees = -10
		Miss = 2
		MissSpeed = -10
	if Miss == 2:
		rotation_degrees += 0.5
		MissSpeed += 0.40
		position.y += MissSpeed
		if position.y > 480:
			Miss = 0
			visible = 0

func Miss():
	Miss = 1
