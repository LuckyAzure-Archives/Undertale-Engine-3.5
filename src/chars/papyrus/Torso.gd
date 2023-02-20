extends AnimatedSprite

func _ready():
	set_ofs()
	connect("frame_changed", self, "set_ofs")

var offsets = [Vector2(-35, -74), Vector2(-70, -74), Vector2(-68, -74)]

func set_ofs():
	set_offset(offsets[get_frame()])
