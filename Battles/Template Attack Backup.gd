extends Node

func Attack():
			if Attack.GlobalCounter > 150 and Attack.GlobalCounter < 180 and Attack.Timer == 0:
				Attack.Timer = 5
				Attack.advancedbone(
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
				Attack.advancedbone(
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
			if Attack.GlobalCounter > 150 and Attack.GlobalCounter < 270 and Attack.Timer2 == 0:
				Attack.Timer2 = 5
				Attack.advancedbone(
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
			if Attack.GlobalCounter > 460 and Attack.GlobalCounter < 500 and Attack.Timer == 0:
				Attack.Timer = 5
				Attack.advancedbone(
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
			if Attack.GlobalCounter > 460 and Attack.GlobalCounter < 500 and Attack.Timer2 == 0:
				Attack.Timer2 = 5
				Attack.advancedbone(
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
			match Attack.GlobalCounter:
				0:
					Battle.changeboxsize(Vector2(125,125))
					Global.scene().get_node("Music").play(60)
				30:
					pass
				100:
					Global.scene().get_node("Camera").scroller_zoom = 0.8
					Attack.bluesoulactivate()
				150:
					Battle.changeboxsize(Vector2(300,125))
				190:
					for n in 4:
						Attack.advancedbone(
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
						Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Battle.changeboxsize(Vector2(150,125))
					Attack.redsoulactivate()
				320:
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.bluesoulactivate()
				520:
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.advancedbone(
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
					Attack.Gasterblaster(
						Vector2(100,Global.scene().get_node("Box/BattleBox").position.y),
						0,
						Vector2(1.5,1.5),
						Vector2(0,-600),
						-25,
						0,
						Vector2(0,0),
						Vector2(0,0)
					)
				840:
					Battle.BattleEnd()
