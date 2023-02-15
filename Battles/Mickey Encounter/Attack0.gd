extends Node

func Attack():
	Effect.RGB_Effect(10,10)
	match Attack.GlobalCounter:
		0:
			Battle.changeboxsize(Vector2(125,130))
			Global.scene().get_node("Music").play(62.85)
			Attack.advancedbone(
				Vector2(340 ,320), #position
				20, #size
				0, #angle
				Vector2(1,0), #movepos
				0,0,0, #movesize, minsize, maxsize
				0, #moveangle
				Vector2(0,0), #changepos
				0, #changesize
				0, #changeangle
				0,-0.12, #bounce, bouncespeed
				250 #lifetime
			)
		1000:
			Battle.BattleEnd()
