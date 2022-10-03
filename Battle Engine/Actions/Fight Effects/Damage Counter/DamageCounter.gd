extends RichTextLabel

var read = 1
var _Text = "1134"
var count = 0

func _ready():
	bbcode_text = "[center]"

func _physics_process(delta):
	if read == 1:
		for i in len(_Text):
			if len(_Text) > count:
				bbcode_text += "[img]res://Battle Engine/Actions/Fight Effects/Damage Counter/damage_" + str(_Text[count]) + ".png"
				count += 1
			visible_characters = count
			if len(_Text) == count:
				read = 0
				count = 0
