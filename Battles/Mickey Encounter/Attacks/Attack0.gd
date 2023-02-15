extends Node

func Bone():
	match Attack.GlobalCounter:
		60 + 30:
			for i in 6:
					Attack.advancedbone(
					Vector2(240 - 12 * i,383), #position
					20, #size
					0, #angle
					Vector2(4 ,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(-0.05 - (i * 0.001),0), #changepos
					0, #changesize
					0, #changeangle
					10,0.01, #bounce, bouncespeed
					500 #lifetime
				)
		120 + 30:
			Attack.Gasterblaster(
				Vector2(250,200),
				90,
				Vector2(1,1),
				Vector2(0,-600),
				0,
				0,
				Vector2(0,0),
				Vector2(-250,0),Vector2(600,0)
			)
		240 + 30:
			for i in 21:
				Attack.advancedbone(
					Vector2(200 - (12 * i),258), #position
					57, #size
					180, #angle
					Vector2(3 ,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					500 #lifetime
				)
			for i in 2:
				Attack.advancedbone(
					Vector2(200 - 120 * i,383), #position
					15, #size
					0, #angle
					Vector2(3,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					500 #lifetime
				)
				Attack.advancedbone(
					Vector2(140 - 120 * i,383 - 30), #position
					15, #size
					0, #angle
					Vector2(3,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					500 #lifetime
				)
			Attack.advancedbone(
				Vector2(200 - 240,383), #position
				15, #size
				0, #angle
				Vector2(3,0), #movepos
				0,0,0, #movesize, minsize, maxsize
				0, #moveangle
				Vector2(0,0), #changepos
				0, #changesize
				0, #changeangle
				0,0, #bounce, bouncespeed
				500 #lifetime
			)

func Attack():
	#Effect.Wave_Effect(0.02,100)
	Bone()
	match Attack.GlobalCounter:
		0:
			Global.scene().get_node("Music").play(0.0)
		30:
			Battle.changeboxsize(Vector2(128,130))
			Attack.bluesoulactivate()
		60 + 30:
			Battle.changeboxsize(Vector2(128,130))
		120 + 30:
			Battle.changeboxsize(Vector2(135,130))
			Global.scene().get_node("Camera").scrollspeed = 0.05
			Global.scene().get_node("Camera")._zoom -= 0.05
		150 + 30:
			Battle.changeboxsize(Vector2(150,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		180 + 30:
			Battle.changeboxsize(Vector2(175,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		210 + 30:
			Battle.changeboxsize(Vector2(200,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		240 + 30:
			Battle.changeboxsize(Vector2(250,130))
			Global.scene().get_node("Camera")._zoom = 1
			Global.scene().get_node("Camera").scrollershake = 10
		358 + 30:
			shakeass()
		476 + 30:
			shakeass()
		594 + 30:
			shakeass()
		712 + 30:
			shakeass()
		830 + 30:
			Global.scene().get_node("Camera").scrollerspeed = 0
			Global.scene().get_node("Camera")._zoom = 0.5
			Global.scene().get_node("Camera")._pos.y = 120
		940 + 30:
			Global.scene().get_node("Camera").scrollerspeed = 0
			Global.scene().get_node("Camera")._zoom = 1
			Global.scene().get_node("Camera")._pos.y = 240
		2000:
			Battle.BattleEnd()

func shakeass():
	Global.scene().get_node("Camera").scroller_zoom = 0.9
	Global.scene().get_node("Camera").scrollershake = 10
	Battle.boxshake(10,5)
