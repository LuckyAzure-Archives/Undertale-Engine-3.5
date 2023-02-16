extends Node

var GlobalCounter = 0

var Counter = 0

var Timer = 0
var Timer2 = 0
var Timer3 = 0

var MiniCounter = 0
var MiniCounter2 = 0
var MiniCounter3 = 0

func _process(delta):
	if Timer > 0:
		Timer -= 50 * delta
	else:
		Timer = 0
	if Timer2 > 0:
		Timer2 -= 50 * delta
	else:
		Timer2 = 0
	if Timer3 > 0:
		Timer3 -= 50 * delta
	else:
		Timer3 = 0

const gasterblasterload = preload("res://src/battle-engine/attacks/gaster-blaster/Gaster Blaster.tscn")

func Gasterblaster(position, angle, size, from, lasertime, waittime, move, moveshot, moveshotspeed):
	var GasterBlaster = gasterblasterload.instance()
	Global.scene().add_child(GasterBlaster)
	GasterBlaster.pos = position
	GasterBlaster.angle = angle
	GasterBlaster.scale = size
	GasterBlaster.scroller = from
	GasterBlaster.lifetime += lasertime
	GasterBlaster.timer += waittime
	GasterBlaster.changepos = move
	GasterBlaster.changeposshot = moveshot
	GasterBlaster.changeposshotspeed = moveshotspeed

const boneload = preload("res://src/battle-engine/attacks/bone/Bone.tscn")

func simplebone(position,size,movepos,lifetime):
	var bone = boneload.instance()
	Global.scene().add_child(bone)
	bone.pos = position
	bone.size = size
	bone.movepos = movepos
	bone.lifetime = lifetime

func normalbone(position,size,angle,movepos,movesize,minsize,maxsize,moveangle,lifetime):
	var bone = boneload.instance()
	Global.scene().add_child(bone)
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
	Global.scene().add_child(bone)
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

func redsoulactivate():
	Global.scene().get_node("Soul/Soul").SoulModes = 0

func bluesoulactivate():
	Global.scene().get_node("Soul/Soul").SoulModes = 1
