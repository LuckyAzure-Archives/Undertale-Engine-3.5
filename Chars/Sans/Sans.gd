extends KinematicBody2D

var Anim = 0
var Anim_Count = 0
var SansMoveX = 0
var SansMoveY = 0

func _physics_process(delta):
	Anim += 0.075
	$Head.position.x = ($Torso.position.x + ( sin(Anim + 50) ) * 1)
	$Head.position.y = (-44 + $Torso.position.y + ( sin((Anim +50)* 2) * 1))
	$Torso.position.x = ($Legs.position.x + ( sin(Anim) ) * 2)
	$Torso.position.y = (-44 + $Legs.position.y + ( sin(Anim * 2) * 2))
