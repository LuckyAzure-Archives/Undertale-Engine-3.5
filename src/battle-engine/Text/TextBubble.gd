extends AnimatedSprite

var TextFlag = false
var TextID = "Normal"
var _text = "test1"
var dialoguecounter = 10
var maxdialoguecounter = 10
var speed = 3
var count = 0
var timer = 0

func _physics_process(delta):
	match TextFlag:
		true:
			if Input.is_action_just_pressed("X"):
				count = len($Text.text)
			if Input.is_action_just_pressed("Z") and len($Text.text):
				NextDialogue()
	_Act_Text(delta)

func ActivateDialogue():
	dialoguecounter = 0
	maxdialoguecounter = get_tree().get_current_scene().DialogueTexts.size()
	TextFlag = true

func NextDialogue():
	count = 0
	timer = 0
	if dialoguecounter < maxdialoguecounter - 1:
		dialoguecounter += 1
	else:
		TextFlag = false
		Battle.BattleStart()

func _Act_Text(_delta):
	match TextFlag:
		true:
			_text = get_tree().get_current_scene().DialogueTexts[dialoguecounter]
			$Text.visible_characters = count
			$Text.bbcode_text = _text
			visible = 1
			if count < (len($Text.text)):
				if not $Text.text.right(1) == " ":
					TextSound()
				if timer < 1:
					timer = speed
					count += 1
				timer -= 1
		false:
			visible = 0
			$Text.visible_characters = -1
			count = 0
			timer = 0

func TextSound():
	match TextID:
		"Normal":
			get_tree().get_current_scene().get_node("SoundChannels/SFXTalkChannel1").stream = load("res://Battle Engine/Sounds/text.wav")
	get_tree().get_current_scene().get_node("SoundChannels/SFXTalkChannel1").play()
