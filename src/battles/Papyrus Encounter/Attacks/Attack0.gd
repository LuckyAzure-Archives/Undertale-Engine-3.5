extends Node

func Bone(counter):
	match counter:
		60:
			Attack.advancedbone(
				Vector2(220,386), #position
				120, #size
				0, #angle
				Vector2(3 ,0), #movepos
				0,0,0, #movesize, minsize, maxsize
				0, #moveangle
				Vector2(-0.05,0), #changepos
				0, #changesize
				0, #changeangle
				0,0, #bounce, bouncespeed
				200 #lifetime
			)
		90:
			for i in 5:
					Attack.advancedbone(
					Vector2(240 - 12 * i,386), #position
					20, #size
					0, #angle
					Vector2(4 ,0), #movepos
					0.05 * i,20,100, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(-0.05 - (i * 0.001),0), #changepos
					0, #changesize
					0, #changeangle
					10,0.01, #bounce, bouncespeed
					500 #lifetime
				)
		150:
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
		270:
			for i in 21:
				Attack.advancedbone(
					Vector2(200 - (12 * i),256), #position
					60, #size
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
					Vector2(200 - 120 * i,386), #position
					15, #size
					0, #angle
					Vector2(3,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
				Attack.advancedbone(
					Vector2(140 - 120 * i,386 - 30), #position
					15, #size
					0, #angle
					Vector2(3,0), #movepos
					0,0,0, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
			Attack.advancedbone(
				Vector2(200 - 240,386), #position
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
		290:
			Attack.advancedbone(
				Vector2(440,386), #position
				118, #size
				0, #angle
				Vector2(-2.1 ,0), #movepos
				0,0,0, #movesize, minsize, maxsize
				0, #moveangle
				Vector2(0.02,0), #changepos
				0, #changesize
				0, #changeangle
				0,0, #bounce, bouncespeed
				250 #lifetime
			)
		370:
			Attack.advancedbone(
				Vector2(180,386), #position
				118, #size
				0, #angle
				Vector2(2 ,0), #movepos
				0,0,0, #movesize, minsize, maxsize
				0, #moveangle
				Vector2(-0.02,0), #changepos
				0, #changesize
				0, #changeangle
				0,0, #bounce, bouncespeed
				210 #lifetime
			)
		400:
			for i in 4:
				Attack.advancedbone(
					Vector2(440 + i * 12,386), #position
					40 + i * 12, #size
					0, #angle
					Vector2(-2 ,0), #movepos
					-0.5,5,100, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(-0.01,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
				Attack.advancedbone(
					Vector2((440 + 48) + i * 12,386), #position
					40 + 36 - i * 12, #size
					0, #angle
					Vector2(-2 ,0), #movepos
					-0.5,5,100, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(-0.01,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
		440:
			for i in 4:
				Attack.advancedbone(
					Vector2(200 - i * 12,386), #position
					40 + i * 12, #size
					0, #angle
					Vector2(2 ,0), #movepos
					-0.5,5,100, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0.01,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
				Attack.advancedbone(
					Vector2((200 - 48) - i * 12,386), #position
					40 + 36 - i * 12, #size
					0, #angle
					Vector2(2 ,0), #movepos
					-0.5,5,100, #movesize, minsize, maxsize
					0, #moveangle
					Vector2(0.01,0), #changepos
					0, #changesize
					0, #changeangle
					0,0, #bounce, bouncespeed
					200 #lifetime
				)
		500:
			bonewheels()
		560:
			bonewheels()
		680:
			Global.scene().get_node("Soul/Soul").Soulrotate = "Left"
			Global.scene().get_node("Papyrus/Torso").play("Left")
		780:
			Global.scene().get_node("Papyrus/Torso").play("Default")

func Attack():
	#Effect.Wave_Effect(0.02,100)
	Bone(Attack.GlobalCounter)
	match Attack.GlobalCounter:
		0:
			Global.scene().get_node("Music").play(0.0)
		30:
			Battle.changeboxsize(Vector2(128,130))
			Attack.bluesoulactivate()
		90:
			Battle.changeboxsize(Vector2(128,130))
		150:
			Battle.changeboxsize(Vector2(135,130))
			Global.scene().get_node("Camera").scrollspeed = 0.05
			Global.scene().get_node("Camera")._zoom -= 0.05
		180:
			Battle.changeboxsize(Vector2(150,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		210:
			Battle.changeboxsize(Vector2(175,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		240:
			Battle.changeboxsize(Vector2(200,130))
			Global.scene().get_node("Camera")._zoom -= 0.05
		270:
			Battle.changeboxsize(Vector2(250,130))
			Global.scene().get_node("Camera")._zoom = 1
			Global.scene().get_node("Camera").scrollershake = 10
		388:
			shakeass()
		506:
			shakeass()
		624:
			shakeass()
		742:
			shakeass()
		860:
			Global.scene().get_node("Camera").scrollerspeed = 0
			Global.scene().get_node("Camera")._zoom = 0.5
			Global.scene().get_node("Camera")._pos.y = 120
		970:
			Global.scene().get_node("Camera").scrollerspeed = 0
			Global.scene().get_node("Camera")._zoom = 1
			Global.scene().get_node("Camera")._pos.y = 240
		2000:
			Battle.BattleEnd()

func shakeass():
	Global.scene().get_node("Camera").scroller_zoom = 0.9
	Global.scene().get_node("Camera").scrollershake = 10
	Battle.boxshake(10,5)

func bonewheels():
	for i in 15:
		Attack.advancedbone(
			Vector2(140,385), #position
			40, #size
			i * 24, #angle
			Vector2(3 ,0), #movepos
			0,5,100, #movesize, minsize, maxsize
			2, #moveangle
			Vector2(0,0), #changepos
			0, #changesize
			0, #changeangle
			0,0, #bounce, bouncespeed
			125 #lifetime
		)
		Attack.advancedbone(
			Vector2(500,240), #position
			40, #size
			i * 24, #angle
			Vector2(-3 ,0), #movepos
			0,5,100, #movesize, minsize, maxsize
			-2, #moveangle
			Vector2(0,0), #changepos
			0, #changesize
			0, #changeangle
			0,0, #bounce, bouncespeed
			125 #lifetime
		)
