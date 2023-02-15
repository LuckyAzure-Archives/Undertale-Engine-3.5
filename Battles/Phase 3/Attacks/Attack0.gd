extends Node

var glitch = 0

func Attack():
	var music = Global.scene().get_node("Music").get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	var BPM = 80
	if (int(music * BPM) - 5) % 120 >= 115 and glitch:
		glitch = false
		Effect.RGB_Effect(10,10)
		Battle.boxshake(10,10)
		Battle.changeboxsize(Vector2(
			Battle.getbox().battlesize.x - 20,
			Battle.getbox().battlesize.y))
	elif int(music * BPM) % 120 < 110:
		glitch = true
	match Attack.GlobalCounter:
		0:
			Battle.changeboxsize(Vector2(320,128))
			Global.scene().get_node("Music").play(261)
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
