extends RichTextLabel

var count = 0
var timer = 0
var _text = "* test"
var TextFlag = false
var speed = 10
var TextID = "Normal"
var ActTextActivate = false
var ActTextStart = false
var ActTexts = 2
var ItemName = ""
var ItemValue = 0
var ItemTextActivate = false
var ItemTextStart = false

func _process(_delta):
	rect_position.x = int(get_tree().get_current_scene().get_node("Box/BattleBox").scroller.x - (get_tree().get_current_scene().get_node("Box/BattleBox").scrollersize.x * 0.5) + 15)
	rect_position.y = int(get_tree().get_current_scene().get_node("Box/BattleBox").scroller.y - (get_tree().get_current_scene().get_node("Box/BattleBox").scrollersize.y * 0.5) + 13)

func _physics_process(delta):
	match get_tree().get_current_scene().Battle:
		0:
			_Act_Text(delta)
		1:
			TextFlag = false
			visible = 0
	
	
	if ItemTextStart == true:
		TextFlag = true
		if Input.is_action_just_pressed("X") and not count == (len(text)):
			count = (len(text))
		if Input.is_action_just_pressed("Z") and count == (len(text)):
			get_tree().get_current_scene()._BattleStart()
			TextFlag = false
			ItemTextStart = false
	
	if ActTextStart == true:
		TextFlag = true
		if Input.is_action_just_pressed("X") and not count == (len(text)):
			count = (len(text))
		if Input.is_action_just_pressed("Z") and count == (len(text)):
			if ActTexts > 1:
				ActTexts -= 1
				count = 0
			else:
				get_tree().get_current_scene()._BattleStart()
				TextFlag = false
				ActTextStart = false

func _Act_Text(_delta):
	if get_tree().get_current_scene().get_node("Actions").Act_Menu == 1:
		TextID = "Normal"
		_text = get_tree().get_current_scene().MainText
		speed = 2
	match TextFlag:
		true:
			visible_characters = count
			bbcode_text = _text
			visible = 1
			if count < (len(text)):
				if not text.right(1) == " ":
					TextSound()
				if timer < 1:
					timer = speed
					count += 1
				timer -= 1
		false: 
			visible_characters = -1
			count = 0
			timer = 0

func TextSound():
	match TextID:
		"Normal":
			get_tree().get_current_scene().get_node("SoundChannels/SFXTalkChannel1").stream = load("res://Battle Engine/Sounds/text.wav")
	get_tree().get_current_scene().get_node("SoundChannels/SFXTalkChannel1").play()
