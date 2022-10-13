extends Node

func _ready():
	get_parent().get_node("Soul/Soul").position = get_parent().get_node("Box/BattleBox").pos

func _process(_delta):
	Act_Selecting()

func _physics_process(delta):
	if healtimer > 0:
		healtimer -= 1
	if healtimer == 1:
		Heal2Sound()
	Fight_Animation(delta)
	if Act_Mercy == 2:
		get_parent().get_node("Soul/Soul").position.x -= 2

var Talk = true
var Act_Menu = 0
var Act_Select = 1
var Act_Fight = 0
var Act_Act = 0
var Act_Act_Select = 0
var Act_Item = 0
var Act_Item_Select = 0
var Act_Item_Page = 0
var Act_Mercy = 0
var Act_Mercy_Select = 0

func Act_Selecting():
	if Act_Menu == 0:
		get_parent().get_node("Action Buttons/Act_Fight").frame = 0
		get_parent().get_node("Action Buttons/Act_Act").frame = 0
		get_parent().get_node("Action Buttons/Act_Item").frame = 0
		get_parent().get_node("Action Buttons/Act_Mercy").frame = 0
	if Act_Menu == 1:
		get_parent().get_node("Box/Text").TextFlag = true
		if Input.is_action_just_pressed("Left"):
			ActSelectSound()
			match Act_Select:
				4:
					Act_Select = 3
				3:
					Act_Select = 2
				2:
					Act_Select = 1
				1:
					Act_Select = 4
		if Input.is_action_just_pressed("Right"):
			ActSelectSound()
			match Act_Select:
				1:
					Act_Select = 2
				2:
					Act_Select = 3
				3:
					Act_Select = 4
				4:
					Act_Select = 1
		if Act_Select == 1:
			get_parent().get_node("Action Buttons/Act_Fight").frame = 1
		else:
			get_parent().get_node("Action Buttons/Act_Fight").frame = 0
		if Act_Select == 2:
			get_parent().get_node("Action Buttons/Act_Act").frame = 1
		else:
			get_parent().get_node("Action Buttons/Act_Act").frame = 0
		if Act_Select == 3:
			get_parent().get_node("Action Buttons/Act_Item").frame = 1
		else:
			get_parent().get_node("Action Buttons/Act_Item").frame = 0
		if Act_Select == 4:
			get_parent().get_node("Action Buttons/Act_Mercy").frame = 1
		else:
			get_parent().get_node("Action Buttons/Act_Mercy").frame = 0
	match Act_Fight:
		1:
			if Input.is_action_just_pressed("X"):
				Act_Menu = 1
				Act_Fight = 0
				ActSelectSound()
			if Input.is_action_just_pressed("Z") and Act_Fight == 1:
				Act_Fight = 2
				ActSelectedSound()
			get_parent().get_node("Box/Text").visible_characters = -1
			if get_tree().get_current_scene().BossSpares == false:
				get_parent().get_node("Box/Text").bbcode_text = "   * " + get_parent().BossName
			else:
				get_parent().get_node("Box/Text").bbcode_text = "[color=#FFFF00]   * " + get_parent().BossName
			get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
			get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
	if Input.is_action_just_pressed("Z") and Act_Select == 1 and Act_Menu == 1:
		Act_Menu = 0
		get_parent().get_node("Box/Text").TextFlag = false
		Act_Fight = 1
		ActSelectedSound()
	match Act_Act:
		1:
			if Input.is_action_just_pressed("X"):
				Act_Menu = 1
				Act_Act = 0
				ActSelectSound()
			if Input.is_action_just_pressed("Z"):
				Act_Act = 2
				Act_Act_Select = 0
				ActSelectedSound()
			get_parent().get_node("Box/Text").visible_characters = -1
			if get_tree().get_current_scene().BossSpares == false:
				get_parent().get_node("Box/Text").bbcode_text = "   * " + get_parent().BossName
			else:
				get_parent().get_node("Box/Text").bbcode_text = "[color=#FFFF00]   * " + get_parent().BossName
			get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
			get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
		2:
			if Input.is_action_just_pressed("X"):
				Act_Act = 1
				ActSelectSound()
			match Act_Act_Select:
				0:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
				1:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
				2:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
				3:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
				4:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 85
				5:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 85
			get_parent().get_node("Box/Text").visible_characters = -1
			DrawActs()
			if Input.is_action_just_pressed("Z"):
				Act_Act = 3
				get_parent().get_node("Soul/Soul").visible = 0
				get_parent().get_node("Box/Text").bbcode_text = " "
				get_parent().get_node("Box/Text").ActTextStart = true
				get_parent().get_node("Box/Text").ActTextActivate = true
				ActSelectedSound()
		3:
			match Act_Act_Select:
				0:
					get_parent().Check()
				1:
					get_parent().Act1()
				2:
					get_parent().Act2()
				3:
					get_parent().Act3()
				4:
					get_parent().Act4()
				5:
					get_parent().Act5()
	if Input.is_action_just_pressed("Z") and Act_Select == 2 and Act_Menu == 1:
		Act_Menu = 0
		Act_Act = 1
		get_parent().get_node("Box/Text").TextFlag = false
		ActSelectedSound()
	match Act_Item:
		1:
			if Input.is_action_just_pressed("X"):
				Act_Menu = 1
				Act_Item = 0
				ActSelectSound()
			DrawItems()
			if Input.is_action_just_pressed("Z"):
				get_parent().get_node("Box/Text").ItemName = get_parent().Items[(Act_Item_Select - 1) * 2]
				get_parent().get_node("Box/Text").ItemValue = get_parent().Items[((Act_Item_Select - 1) * 2) + 1]
				get_parent().Items.remove((Act_Item_Select - 1) * 2)
				get_parent().Items.remove((Act_Item_Select - 1) * 2)
				Act_Item = 2
				get_parent().get_node("Soul/Soul").visible = 0
				get_parent().HP += get_parent().get_node("Box/Text").ItemValue
				if get_parent().HP >= get_parent().HPmax:
					get_parent().get_node("Box/Text")._text = "* You eat the " + get_parent().get_node("Box/Text").ItemName + ".\n* Your HP was maxed out."
					get_parent().HP = get_parent().HPmax
				else:
					get_parent().get_node("Box/Text")._text = "* You eat the " + get_parent().get_node("Box/Text").ItemName + ".\n* You recovered " + str(get_parent().get_node("Box/Text").ItemValue) + " HP!"
				get_parent().get_node("Box/Text").bbcode_text = " "
				get_parent().get_node("Box/Text").ItemTextStart = true
				get_parent().get_node("Box/Text").ItemTextActivate = true
				Heal1Sound()
			match Act_Item_Select:
				1:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
				2:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
				3:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
				4:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
				5:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 17
				6:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 17
				7:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
				8:
					get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 267
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 51
	if Input.is_action_just_pressed("Z") and Act_Select == 3 and Act_Menu == 1 and not get_parent().Items.size() == 0:
		Act_Menu = 0
		Act_Item = 1
		Act_Item_Page = 1
		Act_Item_Select = 1
		get_parent().get_node("Box/Text").TextFlag = false
		ActSelectedSound()
	match Act_Mercy:
		1:
			get_parent().get_node("Box/Text").visible_characters = -1
			if get_tree().get_current_scene().BossSpares == false:
				get_parent().get_node("Box/Text").bbcode_text = "   * Spare"
			else:
				get_parent().get_node("Box/Text").bbcode_text = "[color=#FFFF00]   * Spare[/color]"
			if get_tree().get_current_scene().CanFlee == true:
				get_parent().get_node("Box/Text").bbcode_text += "\n   * Flee"
			get_parent().get_node("Soul/Soul").position.x = get_parent().get_node("Box/Text").rect_position.x + 19
			match Act_Mercy_Select:
				0:
					if Input.is_action_just_pressed("Down") and get_tree().get_current_scene().CanFlee == true:
						Act_Mercy_Select = 1
						ActSelectSound()
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 16
				1:
					if Input.is_action_just_pressed("Up"):
						Act_Mercy_Select = 0
						ActSelectSound()
					get_parent().get_node("Soul/Soul").position.y = get_parent().get_node("Box/Text").rect_position.y + 50
			if Input.is_action_just_pressed("X"):
				Act_Menu = 1
				Act_Mercy = 0
				ActSelectSound()
			if Input.is_action_just_pressed("Z") and Act_Mercy_Select == 0:
				Act_Mercy = 0
				get_tree().get_current_scene()._BattleStart()
				get_tree().get_current_scene().Spare()
				ActSelectedSound()
			if Input.is_action_just_pressed("Z") and Act_Mercy_Select == 1:
				Act_Mercy = 2
				get_parent().get_node("Box/Text").TextFlag = true
				get_parent().get_node("Box/Text")._text = "   * Escaped..."
				ActSelectedSound()
				get_parent().get_node("Soul/Soul/WalkingSoul").visible = 1
				FleeSound()
	if Input.is_action_just_pressed("Z") and Act_Select == 4 and Act_Menu == 1:
		Act_Menu = 0
		Act_Mercy = 1
		Act_Mercy_Select = 0
		get_parent().get_node("Box/Text").TextFlag = false
		ActSelectedSound()

const actspace = "              "
const itemspace = "              "

var fightpanelscrollerangle = 0
var fightpanelscrollersizex = 0
var fightpanelscrollersizey = 0
var fightpanelscrolleralpha = 0
var attackbarscrollerangle = 0
var attackbarscrollersizex = 0
var attackbarscrollersizey = 0
var attackbarscrolleralpha = 0
var attackbarscrollerx = 0
var attackbarscrollery = 0
var fighttimer = 0
var attackbarspeed = 0
var attackbarposition = 0
var backattackbarscrollerfade = 0
var backattackbarscrollersize = 0
var attackbarscrollershake = 0
var damagecountertimer = 0
var damagecounterposx
var damagecounterposy
var damagecounter
var miss = false
var dodged = false

func Fight_Animation(delta):
	damagecounter = 1 - ((abs($"Fight/Fight Panel".position.x - ($"Fight/Attack Bar".position.x - 2)) - 0.5) / 289)
	#print(damagecounter)
	$"Fight/Fight Panel".scale.x = fightpanelscrollersizex
	$"Fight/Fight Panel".scale.y = fightpanelscrollersizey
	$"Fight/Fight Panel".rotation_degrees = fightpanelscrollerangle
	$"Fight/Attack Bar".scale.x = attackbarscrollersizex
	$"Fight/Attack Bar".scale.y = attackbarscrollersizey
	$"Fight/Attack Bar".rotation_degrees = attackbarscrollerangle
#	$"Fight/Fight Panel".scale.y = fightpanelscrolleralpha
	match Act_Fight:
		0:
			fightpanelscrollerangle += (180 - fightpanelscrollerangle) * 0.2
			fightpanelscrolleralpha += (255 - fightpanelscrolleralpha) * 0.2
			fightpanelscrollersizex += (0 - fightpanelscrollersizex) * 0.2
			fightpanelscrollersizey += (0 - fightpanelscrollersizey) * 0.2
			attackbarscrollerangle += (180 - attackbarscrollerangle) * 0.2
			attackbarscrolleralpha += (255 - attackbarscrolleralpha) * 0.2
			attackbarscrollersizex += (0 - attackbarscrollersizex) * 0.2
			attackbarscrollersizey += (0 - attackbarscrollersizey) * 0.2
			attackbarscrollerx += (get_parent().get_node("Box/BattleBox").scroller.x - attackbarscrollerx) * 0.2
			attackbarscrollery += (get_parent().get_node("Box/BattleBox").scroller.y - attackbarscrollery) * 0.2
			$"Fight/Attack Bar".position.x = attackbarscrollerx
			$"Fight/Attack Bar".position.y = attackbarscrollery
			fighttimer = 0
			attackbarposition = 0
			attackbarspeed = 0
		2:
			get_parent().get_node("Box/Text").visible = 0
			get_parent().get_node("Soul/Soul").visible = 0
			$"Fight/Fight Panel".visible = 1
			$"Fight/Attack Bar".visible = 1
			$"Fight/Fight Panel".position.x = get_parent().get_node("Box/BattleBox").scroller.x
			$"Fight/Fight Panel".position.y = get_parent().get_node("Box/BattleBox").scroller.y
			fightpanelscrollerangle += (0 - fightpanelscrollerangle) * 0.3
			fightpanelscrolleralpha += (0 - fightpanelscrolleralpha) * 0.2
			fightpanelscrollersizex += (2 - fightpanelscrollersizex) * 0.2
			fightpanelscrollersizey += (2 - fightpanelscrollersizey) * 0.2
			attackbarscrollerangle += (0 - attackbarscrollerangle) * 0.3
			attackbarscrolleralpha += (0 - attackbarscrolleralpha) * 0.2
			attackbarscrollersizex += (1 - attackbarscrollersizex) * 0.2
			attackbarscrollersizey += (1 - attackbarscrollersizey) * 0.2
			attackbarscrollerx += ((get_parent().get_node("Box/BattleBox").scroller.x - 280) - attackbarscrollerx) * 0.2
			attackbarscrollery += (get_parent().get_node("Box/BattleBox").scroller.y - attackbarscrollery) * 0.2
			fighttimer += 1
			if fighttimer > 30:
				Act_Fight = 3
				attackbarposition = attackbarscrollerx
			$"Fight/Attack Bar".position.x = attackbarscrollerx
			$"Fight/Attack Bar".position.y = attackbarscrollery
		3:
			attackbarposition += attackbarspeed
			attackbarscrollerx += (attackbarposition - attackbarscrollerx) * 1
			$"Fight/Attack Bar".position.x = attackbarscrollerx
			$"Fight/Attack Bar".position.y = attackbarscrollery
			if 320 > attackbarscrollerx:
				attackbarspeed += 0.4
			else:
				if attackbarspeed > 0:
					attackbarspeed -= 0.4
			if Input.is_action_just_pressed("Z"):
				if get_tree().get_current_scene().Talkafterslash == true:
					Talk = true
				if ((get_tree().get_current_scene().ATK - get_tree().get_current_scene().BossDef) * damagecounter) <= 0:
					miss = true
				if get_tree().get_current_scene().DodgeAttack == true:
					get_tree().get_current_scene()._DodgedAttack()
					$"Fight/Miss".Miss()
					dodged = true
					miss = true
				attackbarscrollershake = 32
				Act_Fight = 4
				backattackbarscrollerfade = 1
				backattackbarscrollersize = 1
				$"Fight/Attack Bar Background".position = $"Fight/Attack Bar".position
				$"Fight/Attack Bar Background".visible = 1
				$"Fight/Attack Bar".animation = "Flashing"
				$"Fight/Attack Bar".play()
				$"Fight/Attack Slash".visible = 1
				$"Fight/Attack Slash".frame = 0
				$"Fight/Attack Slash".play()
				get_parent().get_node("SoundChannels/SFXChannel1").stream = load("res://Battle Engine/Sounds/Slash.wav")
				get_parent().get_node("SoundChannels/SFXChannel1").play()
		4:
			backattackbarscrollerfade += (0 - backattackbarscrollerfade) * 0.1
			backattackbarscrollersize += (1.5 - backattackbarscrollersize) * 0.1
			attackbarscrollershake += (0 - attackbarscrollershake) * 0.1
			$"Fight/Attack Bar".position.x = attackbarscrollerx + int(rand_range(0 - attackbarscrollershake, attackbarscrollershake))
			$"Fight/Attack Bar".position.y = attackbarscrollery + int(rand_range(0 - attackbarscrollershake, attackbarscrollershake))
			$"Fight/Attack Bar Background".modulate = Color(1,1,1,backattackbarscrollerfade)
			$"Fight/Attack Bar Background".scale.x = backattackbarscrollersize
			$"Fight/Attack Bar Background".scale.y = backattackbarscrollersize
			if backattackbarscrollerfade < 0.05:
				if miss == false:
					get_tree().get_current_scene()._FightGotHit(delta)
					damagecountertimer = 0
					$"Fight/Attack Bar Background".visible = 0
					Act_Fight = 5
					get_parent().get_node("SoundChannels/SFXChannel1").stream = load("res://Battle Engine/Sounds/Get Hit.wav")
					get_parent().get_node("SoundChannels/SFXChannel1").play()
					damagecounterposx = $"Fight/Damage Counter".rect_position.x
					damagecounterposy = $"Fight/Damage Counter".rect_position.y
					$"Fight/Damage Counter".visible = 1
					$"Fight/Damage Counter".bbcode_text = "[center]"
					$"Fight/Damage Counter"._Text = str(int((get_tree().get_current_scene().ATK - get_tree().get_current_scene().BossDef) * damagecounter))
					$"Fight/Damage Counter".read = 1
					fighttimer = 0
				else:
					if dodged == true:
						dodged = false
					else:
						$"Fight/Miss".Miss()
					get_tree().get_current_scene()._Missed()
					damagecountertimer = 0
					$"Fight/Attack Bar Background".visible = 0
					Act_Fight = 5
					if get_tree().get_current_scene().DodgeAttack == true:
						fighttimer = 50
		5:
			if miss == false:
				if damagecountertimer < 3.1:
					damagecountertimer += 0.1
				$"Fight/Damage Counter".rect_position.x = damagecounterposx
				$"Fight/Damage Counter".rect_position.y = damagecounterposy + (sin(damagecountertimer) * -50)
				if damagecountertimer < 3.1:
					$"Fight/Damage Counter".rect_position.x += rand_range(-2, 2)
					$"Fight/Damage Counter".rect_position.y += rand_range(-2, 2)
			fighttimer += 1
			if fighttimer == 60:
				Act_Fight = 0
				$"Fight/Damage Counter".visible = 0
				if Talk == true:
					get_tree().get_current_scene().get_node("TextBubble").ActivateDialogue()
					Talk = false
					get_tree().get_current_scene().Battle = 0.5
				else:
					get_tree().get_current_scene()._BattleStart()

func ActSelectedSound():
	get_parent().get_node("SoundChannels/SFXChannel1").stream = load("res://Battle Engine/Sounds/Select.wav")
	get_parent().get_node("SoundChannels/SFXChannel1").play()

func ActSelectSound():
	get_parent().get_node("SoundChannels/SFXChannel1").stream = load("res://Battle Engine/Sounds/Switch.wav")
	get_parent().get_node("SoundChannels/SFXChannel1").play()

var healtimer = 0

func Heal1Sound():
	get_parent().get_node("SoundChannels/SFXChannel1").stream = load("res://Battle Engine/Sounds/heal1.wav")
	get_parent().get_node("SoundChannels/SFXChannel1").play()
	healtimer = 20

func Heal2Sound():
	get_parent().get_node("SoundChannels/SFXChannel2").stream = load("res://Battle Engine/Sounds/heal2.wav")
	get_parent().get_node("SoundChannels/SFXChannel2").play()

func FleeSound():
	get_parent().get_node("SoundChannels/SFXSoulChannel1").stream = load("res://Battle Engine/Sounds/flee.wav")
	get_parent().get_node("SoundChannels/SFXSoulChannel1").play()

func DrawActs():
	if Input.is_action_just_pressed("Left") and Act_Act_Select > 0:
		Act_Act_Select -= 1
		ActSelectSound()
	if Input.is_action_just_pressed("Right") and Act_Act_Select < get_parent().Acts.size():
		Act_Act_Select += 1
		ActSelectSound()
	if Input.is_action_just_pressed("Up") and Act_Act_Select > 1:
		Act_Act_Select -= 2
		ActSelectSound()
	if Input.is_action_just_pressed("Down") and (Act_Act_Select + 1) < get_parent().Acts.size():
		Act_Act_Select += 2
		ActSelectSound()
	get_parent().get_node("Box/Text").bbcode_text = "   * Check         "
	if get_parent().Acts.size() > 0:
			get_parent().get_node("Box/Text").bbcode_text += "* " + get_parent().Acts[0]
	if get_parent().Acts.size() > 1:
			get_parent().get_node("Box/Text").bbcode_text += "\n   * " + get_parent().Acts[1] + actspace.left(14 - len(get_parent().Acts[1])) 
	if get_parent().Acts.size() > 2:
			get_parent().get_node("Box/Text").bbcode_text += "* " + get_parent().Acts[2]
	if get_parent().Acts.size() > 3:
			get_parent().get_node("Box/Text").bbcode_text += "\n   * " + get_parent().Acts[3] + actspace.left(14 - len(get_parent().Acts[3]))
	if get_parent().Acts.size() > 4:
			get_parent().get_node("Box/Text").bbcode_text += "* " + get_parent().Acts[4]

func DrawItems():
	match Act_Item_Select:
		1:
			if Input.is_action_just_pressed("Right") and 1 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 1
				ActSelectSound()
			if Input.is_action_just_pressed("Down") and 2 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 2
				ActSelectSound()
		2:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select -= 1
				ActSelectSound()
			if Input.is_action_just_pressed("Right") and 4 < (get_parent().Items.size() * 0.5):
				Act_Item_Select = 5
				ActSelectSound()
			if Input.is_action_just_pressed("Down") and 3 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 2
				ActSelectSound()
		3:
			if Input.is_action_just_pressed("Right") and 3 < (get_parent().Items.size() * 0.5):
				Act_Item_Select = 4
				ActSelectSound()
			if Input.is_action_just_pressed("Up"):
				Act_Item_Select -= 2
				ActSelectSound()
		4:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select -= 1
				ActSelectSound()
			if Input.is_action_just_pressed("Right") and 6 < (get_parent().Items.size() * 0.5):
				Act_Item_Select = 7
				ActSelectSound()
			if Input.is_action_just_pressed("Up"):
				Act_Item_Select -= 2
				ActSelectSound()
		5:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select = 2
				ActSelectSound()
			if Input.is_action_just_pressed("Right") and 5 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 1
				ActSelectSound()
			if Input.is_action_just_pressed("Down") and 6 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 2
				ActSelectSound()
		6:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select -= 1
				ActSelectSound()
			if Input.is_action_just_pressed("Down") and 7 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 2
				ActSelectSound()
		7:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select = 4
				ActSelectSound()
			if Input.is_action_just_pressed("Right") and 7 < (get_parent().Items.size() * 0.5):
				Act_Item_Select += 1
				ActSelectSound()
			if Input.is_action_just_pressed("Up"):
				Act_Item_Select -= 2
				ActSelectSound()
		8:
			if Input.is_action_just_pressed("Left"):
				Act_Item_Select -= 1
				ActSelectSound()
			if Input.is_action_just_pressed("Up"):
				Act_Item_Select -= 2
				ActSelectSound()
	if Act_Item_Select > 4:
		Act_Item_Page = 2
	else:
		Act_Item_Page = 1
	if Act_Item_Page == 1:
		if (get_parent().Items.size() * 0.5) > 0:
			get_parent().get_node("Box/Text").bbcode_text = "   * " + str(get_parent().Items[0]) + itemspace.left(14 - len(str(get_parent().Items[0])))
		if (get_parent().Items.size() * 0.5) > 1:
			get_parent().get_node("Box/Text").bbcode_text += "* " + str(get_parent().Items[2]) + "\n"
		if (get_parent().Items.size() * 0.5) == 1:
			get_parent().get_node("Box/Text").bbcode_text += "\n"
		if (get_parent().Items.size() * 0.5) > 2:
			get_parent().get_node("Box/Text").bbcode_text += "   * " + str(get_parent().Items[4]) + itemspace.left(14 - len(str(get_parent().Items[4]))) 
		if (get_parent().Items.size() * 0.5) > 3:
			get_parent().get_node("Box/Text").bbcode_text += "* " + str(get_parent().Items[6])
		get_parent().get_node("Box/Text").bbcode_text += "\n                     PAGE 1"
	if Act_Item_Page == 2:
		if (get_parent().Items.size() * 0.5) > 4:
			get_parent().get_node("Box/Text").bbcode_text = "   * " + str(get_parent().Items[8]) + itemspace.left(14 - len(str(get_parent().Items[8])))
		if (get_parent().Items.size() * 0.5) > 5:
			get_parent().get_node("Box/Text").bbcode_text += "* " + str(get_parent().Items[10]) + "\n"
		if (get_parent().Items.size() * 0.5) == 5:
			get_parent().get_node("Box/Text").bbcode_text += "\n"
		if (get_parent().Items.size() * 0.5) > 6:
			get_parent().get_node("Box/Text").bbcode_text += "   * " + str(get_parent().Items[12]) + itemspace.left(14 - len(str(get_parent().Items[12]))) 
		if (get_parent().Items.size() * 0.5) > 7:
			get_parent().get_node("Box/Text").bbcode_text += "* " + str(get_parent().Items[14])
		get_parent().get_node("Box/Text").bbcode_text += "\n                     PAGE 2"

func _on_Attack_Slash_animation_finished():
	$"Fight/Attack Slash".visible = 0

