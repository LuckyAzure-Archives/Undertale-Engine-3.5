extends Node2D


var PlayerName = "Chara"
var LV = 6
var HP = 40
var HPmax = 40
var HPKR = 40
var HPTYPE = "KR"
var ATK = 2000

var Acts = ["Test1", "Test2", "Test3", "Test4", "Test5"] #Only 5 acts!
var Items = ["Test1", 10] #Only 8 items!
#           [ItemName, Value]
var BossName = "Sans"
var BossHP = 1000
var BossHPMax = 1000
var BossHPShow = true
var BossDef = 1500
var BossDamage = 1
var CanFlee = true
var DodgeAttack = true
var Dodgeoffset = Vector2(320,0)
var Talkafterslash = true

var MainText = "* Test"

func _ready():
	$Music.play(36)
	$"Actions".Act_Menu = 0
	_BattleStart()

func _debug():
	$Debug.text = "is_on_floor: " + str($Soul/Soul.is_on_floor()) + "\n"
	$Debug.text += "is_on_ceiling: " + str($Soul/Soul.is_on_ceiling()) + "\n"
	$Debug.text += "is_on_wall: " + str($Soul/Soul.is_on_wall()) + "\n"
	$Debug.text += "HurtboxBlueCount: " + str($Soul/Soul.HurtboxBlueCount) + "\n"
	$Debug.text += "Moving: " + str($Soul/Soul.Moving) + "\n"
	$Debug.text += "time: " + str(Attack_GlobalCounter) + "\n"
	$Debug.text += "mousepos: " + str(get_viewport().get_mouse_position()) + "\n"

func Check():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 2
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "* Sans - ATK 69 DEF 69\n  test dialogue"
		2:
			$"Box/Text"._text = "lol"

func Act1():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 1
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "test1"

func Act2():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 1
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "test2"

func Act3():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 1
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "test3"

func Act4():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 1
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "test4"

func Act5():
	if $"Box/Text".ActTextActivate == true:
		$"Box/Text".ActTexts = 1
		$"Box/Text".ActTextActivate = false
	match $"Box/Text".ActTexts:
		1:
			$"Box/Text"._text = "test5"

var BossSpares = false

func Spare():
	pass

func _FightGotHit(delta):
	Attack_Counter += 1

func _Missed(delta):
	pass

func _DodgedAttack(delta):
	pass

var DialogueID = 1
var DialogueText = "test"
var DialogueTexts

func _dialogues():
	get_tree().get_current_scene().get_node("TextBubble")._text = DialogueText
	match DialogueID:
		1:
			DialogueTexts = [
				"test1",
				"test2",
				"test3",
				"test4",
				"test5"
				]

var Battle = 0
var BattleStart = 0
var Battle_Pos = Vector2(320,320)
var Battle_Size = Vector2(320,320)
var Battle_Angle = 0

var Attack_Counter = 0
var Attack_GlobalCounter = 0
var Attack_MiniCounter = 0
var Attack_MiniCounter2 = 0
var Attack_MiniCounter3 = 0
var Attack_Timer = 0
var Attack_Timer2 = 0
var Attack_Timer3 = 0

func _attacks(delta):
	match Attack_Counter:
		0:
			if Attack_GlobalCounter > 150 and Attack_GlobalCounter < 180 and Attack_Timer == 0:
				Attack_Timer = 5
				advancedbone(
					Vector2(180,383), #position
					40, #size
					0, #angle
					Vector2(5,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(-0.07,0), #changepos
					0, #changesize
					0, #changeangle
					20,-0.12, #bounce, bouncespeed
					250 #lifetime
				)
				advancedbone(
					Vector2(460,383), #position
					40, #size
					0, #angle
					Vector2(-5,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0.07,0), #changepos
					0, #changesize
					0, #changeangle
					20,-0.12, #bounce, bouncespeed
					250 #lifetime
				)
			if Attack_GlobalCounter > 150 and Attack_GlobalCounter < 270 and Attack_Timer2 == 0:
				Attack_Timer2 = 5
				advancedbone(
					Vector2(480,258), #position
					22, #size
					180, #angle
					Vector2(-4,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					20,0.12, #bounce, bouncespeed
					300 #lifetime
				)
			if Attack_GlobalCounter > 460 and Attack_GlobalCounter < 500 and Attack_Timer == 0:
				Attack_Timer = 5
				advancedbone(
					Vector2(460,383), #position
					20, #size
					0, #angle
					Vector2(-4,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					20,0, #bounce, bouncespeed
					250 #lifetime
				)
			if Attack_GlobalCounter > 460 and Attack_GlobalCounter < 500 and Attack_Timer2 == 0:
				Attack_Timer2 = 5
				advancedbone(
					Vector2(480,258), #position
					22, #size
					180, #angle
					Vector2(-4,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					20,0.12, #bounce, bouncespeed
					300 #lifetime
				)
			match Attack_GlobalCounter:
				0:
					$Box/BattleBox.battlesize = Vector2(125,125)
					$Music.play(27.3)
					$Sans/Legs/Torso/Head.frame = 1
				30:
					pass
				100:
					$Camera.scroller_zoom = 0.8
					bluesoulactivate()
				150:
					$Box/BattleBox.battlesize = Vector2(300,125)
				190:
					for n in 4:
						advancedbone(
							Vector2(150 + (12 * (n - 1)) ,383), #position
							14 + (4 * (n - 1)), #size
							0, #angle
							Vector2(7,0), #movepos
							0,0,0, #movesize, minsize, maxsize
							0, #moveangle
							Vector2(-0.25,0), #changepos
							0, #changesize
							0, #changeangle
							0,-0.12, #bounce, bouncespeed
							250 #lifetime
						)
						advancedbone(
							Vector2(490 - (12 * (n - 1)),383), #position
							14 + (4 * (n - 1)), #size
							0, #angle
							Vector2(-7,0), #movepos
							0,0,0, #movesize, minsize, maxsize
							0, #moveangle
							Vector2(0.25,0), #changepos
							0, #changesize
							0, #changeangle
							0,-0.12, #bounce, bouncespeed
							250 #lifetime
						)
				200:
					advancedbone(
						Vector2(160,383), #position
						113, #size
						0, #angle
						Vector2(5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(-0.3,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(480,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.3,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				300:
					$Box/BattleBox.battlesize = Vector2(150,125)
					redsoulactivate()
				320:
					advancedbone(
						Vector2(220,383), #position
						113, #size
						0, #angle
						Vector2(5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(-0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(420,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				350:
					advancedbone(
						Vector2(250,383), #position
						113, #size
						0, #angle
						Vector2(5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(-0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(450,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				380:
					advancedbone(
						Vector2(220,383), #position
						113, #size
						0, #angle
						Vector2(5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(-0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(420,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				410:
					advancedbone(
						Vector2(190,383), #position
						113, #size
						0, #angle
						Vector2(5,0), #movepos
						2,1,113, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(-0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(390,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						2,1,113, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.175,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						200 #lifetime
					)
				440:
					bluesoulactivate()
				520:
					advancedbone(
						Vector2(420,383), #position
						113, #size
						0, #angle
						Vector2(-5,0), #movepos
						0,0,0, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0.15,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				540:
					advancedbone(
						Vector2(240,383), #position
						20, #size
						0, #angle
						Vector2(2,0), #movepos
						0,1,113, #movesize, minsize, maxsize
						0, #moveangle
						Vector2(0,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
					advancedbone(
						Vector2(240,258), #position
						80, #size
						45, #angle
						Vector2(0,0), #movepos
						0,1,113, #movesize, minsize, maxsize
						2, #moveangle
						Vector2(0,0), #changepos
						0, #changesize
						0, #changeangle
						0,0, #bounce, bouncespeed
						100 #lifetime
					)
				590:
					Gasterblaster(
						Vector2(100,$Box/BattleBox.position.y),
						0,
						Vector2(1.5,1.5),
						Vector2(0,-600),
						-25,
						0,
						Vector2(0,0),
						Vector2(0,0)
					)
				840:
					$Sans.shake.x = 2
					$Sans.armshake = 2.5
					$Sans/Legs/Torso/Head.frame = 3
					$Camera._pos.y -= 10
					$Camera._zoom -= 0.1
					$Effects/GlitchyEffect.Amount = 50
				870:
					$Sans.shake.x = 4
					$Sans.armshake = 5
					$Sans/Legs/Torso/LeftArm/Down.hide()
					$Sans/Legs/Torso/RightArm/Down.hide()
					$Sans/Legs/Torso/LeftArm/Open.show()
					$Sans/Legs/Torso/RightArm/Open.show()
					$Sans.scale = Vector2(2.25,1.75)
					$Camera._pos.y -= 20
					$Camera._zoom -= 0.15
					$Effects/GlitchyEffect.Amount = 50
					$Effects/GlitchyEffect.WaveAmount = 0.1
				900:
					$Sans.shake.x = 6
					$Sans.armshake = 10
					$Sans/Legs/Torso/Head.frame = 1
					$Camera._pos.y -= 25
					$Camera._zoom -= 0.2
					$Effects/GlitchyEffect.Amount = 50
					$Effects/GlitchyEffect.WaveAmount = 0.1
				930:
					$Sans.shake.x = 8
					$Sans.armshake = 20
					$Sans/Legs/Torso/Head.frame = 2
					$Camera._pos.y -= 25
					$Camera._zoom -= 0.2
					$Effects/GlitchyEffect.Amount = 50
				960:
					$Sans/Legs/Torso/LeftArm/Open.hide()
					$Sans/Legs/Torso/RightArm/Open.hide()
					$Sans/Legs/Torso/LeftArm/Sword.show()
					$Sans/Legs/Torso/RightArm/Sword.show()
					$Sans.armshake = 0
					$Camera._pos.y = 240
					$Camera._zoom = 1
					$Sans.shake.x = 10
					$Sans.armshake = 20
					$Sans/Legs/Torso/Head.frame = 0
					MainText = "* Sans stares into your SOUL, with a grim look."
					_BattleEnd()
					$Effects/GlitchyEffect.Amount = 150
		1:
			match Attack_GlobalCounter:
				0:
					$"Dusttrust Sans Phase 1".anim_poses = 0

	if Battle == 1:
		Attack_GlobalCounter += 1

func _timers(delta):
	if Attack_Timer > 0:
		Attack_Timer -= 1
	if Attack_Timer2 > 0:
		Attack_Timer2 -= 1
	if Attack_Timer3 > 0:
		Attack_Timer3 -= 1

func _physics_process(delta):
	_debug()
	_dialogues()
	_timers(delta)
	_testing(delta)
	if Battle == 1:
		_attacks(delta)
	if 0 == 1:
		redsoulactivate()
		bluesoulactivate()

func redsoulactivate():
	$Soul/Soul.SoulModes = 0

func bluesoulactivate():
	$Soul/Soul.SoulModes = 1

func _process(delta):
	get_node("Sans").position.y = get_node("Box/BattleBox").position.y - (get_node("Box/BattleBox").scrollersize.y * 0.5) - 12

var gasterblasterload = load("res://Battle Engine/Attacks/Gaster Blaster/Gaster Blaster.tscn")
var GasterBlaster = gasterblasterload.instance()

func Gasterblaster(position, angle, size, from, lasertime, waittime, move, moveshot):
	var GasterBlaster = gasterblasterload.instance()
	add_child(GasterBlaster)
	GasterBlaster.pos = position
	GasterBlaster.angle = angle
	GasterBlaster.scale = size
	GasterBlaster.scroller = from
	GasterBlaster.lifetime += lasertime
	GasterBlaster.timer += waittime
	GasterBlaster.changepos = move
	GasterBlaster.changeposshot = moveshot

var boneload = load("res://Battle Engine/Attacks/Bone/Bone.tscn")
var bone = boneload.instance()

func simplebone(position,size,movepos,lifetime):
	var bone = boneload.instance()
	add_child(bone)
	bone.pos = position
	bone.size = size
	bone.movepos = movepos
	bone.lifetime = lifetime

func bone(position,size,angle,movepos,movesize,minsize,maxsize,moveangle,lifetime):
	var bone = boneload.instance()
	add_child(bone)
	bone.pos = position
	bone.size = size
	bone.angle = angle
	bone.movepos = movepos
	bone.movesize = movesize
	bone.minsize = minsize
	bone.maxsize = maxsize
	bone.moveangle = moveangle
	bone.lifetime = lifetime

func advancedbone(position,size,angle,movepos,movesize,minsize,maxsize,moveangle,changepos,changesize,changeangle,bounce,bouncespeed,lifetime):
	var bone = boneload.instance()
	add_child(bone)
	bone.pos = position
	bone.size = size
	bone.angle = angle
	bone.movepos = movepos
	bone.movesize = movesize
	bone.minsize = minsize
	bone.maxsize = maxsize
	bone.moveangle = moveangle
	bone.changepos = changepos
	bone.changesize = changesize
	bone.changeangle = changeangle
	bone.bounce = bounce
	bone.bouncespeed = bouncespeed
	bone.lifetime = lifetime

func _testing(delta):
	if Input.is_action_just_pressed("ui_end"):
		pass

func _BattleStart():
	Attack_GlobalCounter = 0
	Battle = 1
	$"Soul/Soul".visible = 1
	$"Soul/Soul".position = get_node("Box/BattleBox").pos

func _BattleEnd():
	$"Actions".Act_Menu = 1
	$"Actions".Act_Fight = 0
	$"Actions".Act_Act = 0
	$"Actions".Act_Item = 0
	$"Actions".Act_Mercy = 0
	Battle = 0
	$"Soul/Soul".visible = 1
	Attack_GlobalCounter = 0
	Attack_MiniCounter = 0
	Attack_MiniCounter2 = 0
	Attack_MiniCounter3 = 0
