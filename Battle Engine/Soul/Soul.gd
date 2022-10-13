extends KinematicBody2D

var SoulModes = 0
#Default Rotation: "Down"
var Soulrotate = "Down"
var MoveY = 0
var MoveX = 0
var Damage = 0
var DamageTimer = 0
var DamageTime = 50
var HurtboxCount = 0
var HurtboxBlueCount = 0
var HurtboxOrangeCount = 0
var Moving = false

func _ready():
	rotation_degrees = 0

func _process(delta):
	var currentscene = get_tree().get_current_scene()
	$Sprite.frame = SoulModes
	if currentscene.Battle == 0:
		if currentscene.get_node("Actions").Act_Menu == 1:
			actheartpositioning(currentscene)
	if get_tree().get_current_scene().Battle == 0.5:
		visible = 1
		position = get_tree().get_current_scene().get_node("Box/BattleBox").pos
	var oldpos = position
	if get_tree().get_current_scene().Battle == 1:
		match SoulModes:
			0:
				_red_delta(delta)
			1:
				_blue_delta(delta)
	if (int(oldpos.x) != int(position.x)) or (int(oldpos.y) != int(position.y)):
		Moving = true
	else:
		Moving = false
	#this shit fixes the soul's weird pixel
	#$Sprite.position = position - Vector2(round(position.x),round(position.y))

func _red_delta(_delta):
	var speed = 100
	if Input.is_action_pressed("X"):
		speed = speed / 2
	if Input.is_action_pressed("Up"):
		MoveY = -speed
	elif Input.is_action_pressed("Down"):
		MoveY = speed
	else:
		MoveY=0
	if Input.is_action_pressed("Left"):
		MoveX = -speed
	elif Input.is_action_pressed("Right"):
		MoveX = speed
	else:
		MoveX=0
	var _velocity = move_and_slide(Vector2(MoveX, MoveY))

var jump = 0

func _blue_delta(delta):
	var speed = 150
	if Input.is_action_pressed("X"):
		speed = speed / 2
	match Soulrotate:
		"Down":
			if Input.is_action_pressed("Left"):
				MoveX = -speed
			elif Input.is_action_pressed("Right"):
				MoveX = speed
			else:
				MoveX = 0
			if is_on_floor():
				jump = 0
				MoveY = 0
			if is_on_floor() and Input.is_action_pressed("Up"):
				MoveY = -300
				jump = 1
			if MoveY < -50 and jump == 1 and not Input.is_action_pressed("Up"):
				MoveY = -50
				jump = 0
			if not is_on_floor():
				if MoveY < 200:
					MoveY += 10 * (delta / 0.016667)
			if is_on_ceiling():
				MoveY = 10
		"Left":
			if Input.is_action_pressed("Up"):
				MoveY = -speed
			elif Input.is_action_pressed("Down"):
				MoveY = speed
			else:
				MoveY = 0
			if is_on_floor():
				jump = 0
				MoveX = 0
			if is_on_floor() and Input.is_action_pressed("Right"):
				MoveX = 300
				jump = 1
			if MoveX > 50 and jump == 1 and not Input.is_action_pressed("Right"):
				MoveX = 50
				jump = 0
			if not is_on_floor():
				if MoveX > -200:
					MoveX += -10 * (delta / 0.016667)
			if is_on_ceiling():
				MoveX = -10
		"Up":
			if Input.is_action_pressed("Left"):
				MoveX = -speed
			elif Input.is_action_pressed("Right"):
				MoveX = speed
			else:
				MoveX = 0
			if is_on_floor():
				jump = 0
				MoveY = 0
			if is_on_floor() and Input.is_action_pressed("Down"):
				MoveY = 300
				jump = 1
			if MoveY > 50 and jump == 1 and not Input.is_action_pressed("Down"):
				MoveY = 50
				jump = 0
			if not is_on_floor():
				if MoveY > -200:
					MoveY += -10 * (delta / 0.016667)
			if is_on_ceiling():
				MoveY = -10
		"Right":
			if Input.is_action_pressed("Up"):
				MoveY = -speed
			elif Input.is_action_pressed("Down"):
				MoveY = speed
			else:
				MoveY = 0
			if is_on_floor():
				jump = 0
				MoveX = 0
			if is_on_floor() and Input.is_action_pressed("Left"):
				MoveX = -300
				jump = 1
			if MoveX < -50 and jump == 1 and not Input.is_action_pressed("Left"):
				MoveX = -50
				jump = 0
			if not is_on_floor():
				if MoveX < 200:
					MoveX += 10 * (delta / 0.016667)
			if is_on_ceiling():
				MoveX = 10
	var _velocity
	match Soulrotate:
		"Down":
			rotation_degrees = 0
			_velocity = move_and_slide(Vector2(MoveX, MoveY),Vector2(0, -1))
		"Left":
			rotation_degrees = 90
			_velocity = move_and_slide(Vector2(MoveX, MoveY),Vector2(1, 0))
		"Up":
			rotation_degrees = 180
			_velocity = move_and_slide(Vector2(MoveX, MoveY),Vector2(0, 1))
		"Right":
			rotation_degrees = 270
			_velocity = move_and_slide(Vector2(MoveX, MoveY),Vector2(-1, 0))

var changescene

func actheartpositioning(currentscene):
	if currentscene.get_node("Actions").Act_Menu == 1:
		match currentscene.get_node("Actions").Act_Select:
			1:
				position.x = currentscene.get_node("Action Buttons/Act_Fight").position.x - 38
				position.y = currentscene.get_node("Action Buttons/Act_Fight").position.y + 1
			2:
				position.x = currentscene.get_node("Action Buttons/Act_Act").position.x - 37
				position.y = currentscene.get_node("Action Buttons/Act_Act").position.y + 1
			3:
				position.x = currentscene.get_node("Action Buttons/Act_Item").position.x - 39
				position.y = currentscene.get_node("Action Buttons/Act_Item").position.y + 1
			4:
				position.x = currentscene.get_node("Action Buttons/Act_Mercy").position.x - 39
				position.y = currentscene.get_node("Action Buttons/Act_Mercy").position.y + 1

func _physics_process(_delta):
	var currentscene = get_tree().get_current_scene()
	if currentscene.get_node("Soul/Soul").Damage == 1:
		currentscene.get_node("SoundChannels/SFXSoulChannel1").stream = load("res://Battle Engine/Sounds/damage.wav")
		currentscene.get_node("SoundChannels/SFXSoulChannel1").play()
		if currentscene.HPTYPE == "":
			currentscene.HP -= currentscene.BossDamage
			if currentscene.HP < 1:
				Global.heartposx = currentscene.get_node("Soul/Soul").position.x
				Global.heartposy = currentscene.get_node("Soul/Soul").position.y
				changescene = get_tree().change_scene("res://Game Over/Game Over.tscn")
		else:
			if currentscene.HP > 1 and currentscene.HP <= currentscene.BossDamage:
				currentscene.HP = 1
			else: if currentscene.HP > 1:
				currentscene.HP -= currentscene.BossDamage
			if currentscene.HPKR > currentscene.HP and currentscene.HP == 1:
				currentscene.HPKR -= currentscene.BossDamage
			if currentscene.HPKR == 1 and currentscene.HP == 1:
				Global.heartposx = currentscene.get_node("Soul/Soul").position.x
				Global.heartposy = currentscene.get_node("Soul/Soul").position.y
				changescene = get_tree().change_scene("res://Game Over/Game Over.tscn")

func _on_Hitbox_area_entered(area):
	match area.name:
		"Hurtbox":
			HurtboxCount += 1
		"HurtboxBlue":
			HurtboxBlueCount += 1
		"HurtboxOrange":
			HurtboxOrangeCount += 1
	if HurtboxCount > 0 or (HurtboxBlueCount > 0 and Moving) or (HurtboxOrangeCount > 0 and !Moving):
		Damage = 1
	else:
		Damage = 0

func _on_Hitbox_area_exited(area):
	match area.name:
		"Hurtbox":
			HurtboxCount -= 1
		"HurtboxBlue":
			HurtboxBlueCount -= 1
		"HurtboxOrange":
			HurtboxOrangeCount -= 1
	if HurtboxCount > 0 or (HurtboxBlueCount > 0 and Moving) or (HurtboxOrangeCount > 0 and !Moving):
		Damage = 1
	else:
		Damage = 0
