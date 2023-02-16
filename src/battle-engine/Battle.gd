extends Node

var steps = 0
var AttackScript = GDScript.new()

func Attacks():
	pass

func BattleStart():
	var path = "res://src/battles/" + Global.scene().BattleFolderName + "/Attacks/Attack" + str(Attack.Counter) + ".gd"
	AttackScript = load(path).new()
	Attack.GlobalCounter = 0
	steps = 1
	Global.scene().get_node("Soul/Soul").visible = 1
	Global.scene().get_node("Soul/Soul").position = Global.scene().get_node("Box/BattleBox").pos

func BattleEnd():
	Global.scene().get_node("Actions").Act_Menu = 1
	Global.scene().get_node("Actions").Act_Fight = 0
	Global.scene().get_node("Actions").Act_Act = 0
	Global.scene().get_node("Actions").Act_Item = 0
	Global.scene().get_node("Actions").Act_Mercy = 0
	steps = 0
	Global.scene().get_node("Soul/Soul").visible = 1
	Attack.GlobalCounter = 0
	Attack.MiniCounter = 0
	Attack.MiniCounter2 = 0
	Attack.MiniCounter3 = 0

func getbox():
	return Global.scene().get_node("Box/BattleBox")

func changeboxpos(pos):
	Global.scene().get_node("Box/BattleBox").battlepos = pos

func changeboxsize(size):
	Global.scene().get_node("Box/BattleBox").battlesize = size

func boxshake(amount,speed):
	Global.scene().get_node("Box/BattleBox").boxshake = amount
	Global.scene().get_node("Box/BattleBox").boxshakespeed = speed
