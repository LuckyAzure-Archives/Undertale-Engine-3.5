extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if get_parent().Act_Menu == 1:
		if get_parent().Act_Select == 1:
			frame = 1
		if not get_parent().Act_Select == 1:
			frame = 0
