extends Node2D

var BattleFolderName = "Phase 3"

var PlayerName = "Chara"
var LV = 8
var HP = 48
var HPmax = 48
var HPKR = 48
var HPTYPE = ""
var ATK = 2000

var Acts = ["Test1", "Test2", "Test3", "Test4", "Test5"] #Only 5 acts!
var Items = ["Test1", 10] #Only 8 items!
#           [ItemName, Value]
var BossName = "Sans"
var BossHP = 1000
var BossHPMax = 1000
var BossHPShow = true
var BossDef = 1500
var BossDamage = 20
var CanFlee = true
var DodgeAttack = true
var Dodgeoffset = Vector2(320,0)
var Talkafterslash = true

var MainText = "* Test"

func _ready():
	$"Actions".Act_Menu = 0
	Battle.BattleStart()

func _debug():
	$Debug.text = "is_on_floor: " + str($Soul/Soul.is_on_floor()) + "\n"
	$Debug.text += "is_on_ceiling: " + str($Soul/Soul.is_on_ceiling()) + "\n"
	$Debug.text += "is_on_wall: " + str($Soul/Soul.is_on_wall()) + "\n"
	$Debug.text += "HurtboxBlueCount: " + str($Soul/Soul.HurtboxBlueCount) + "\n"
	$Debug.text += "Moving: " + str($Soul/Soul.Moving) + "\n"
	$Debug.text += "time: " + str(Attack.Timer) + "\n"
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

func _FightGotHit():
	Attack.Counter += 1

func _Missed():
	pass

func _DodgedAttack():
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

var Battle_Pos = Vector2(320,320)
var Battle_Size = Vector2(320,320)
var Battle_Angle = 0

func _attacks(_delta):
	Battle.AttackScript.Attack()
	if Battle.steps == 1:
		Attack.GlobalCounter += 1

func _physics_process(delta):
	_debug()
	_dialogues()
	if Battle.steps == 1:
		_attacks(delta)
	if 0 == 1:
		Attack.redsoulactivate()
		Attack.bluesoulactivate()
