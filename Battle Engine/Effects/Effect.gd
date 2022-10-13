extends Sprite

var Anim = 0

func _ready():
	pass

func _process(delta):
	Anim += 2 * delta
	scale.y = 1.75 + (sin(Anim) * 0.75) 
