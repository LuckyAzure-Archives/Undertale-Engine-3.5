extends Node2D

var brokenload = load("res://src/scenes/game-over/BrokenPiece.tscn")
var broken = brokenload.instance()
var timer = 0
var dir = 0
var scrolspe = 0

func broke():
	var broken = brokenload.instance()
	add_child(broken)

func _ready():
	$Heart.position.x = Global.heartposx
	$Heart.position.y = Global.heartposy

func _physics_process(delta):
	scrolspe += (0.1 - scrolspe) * 0.05
	$Heart.position.x += (320 - $Heart.position.x) * scrolspe
	$Heart.position.y += (240 - $Heart.position.y) * scrolspe
	timer += 1
	if timer > 100 and timer < 120:
		$Camera.scrollershake += 1.2
		$Camera.scroller_zoom -= 0.05
	match timer:
		50:
			$AudioStreamPlayer.stream = load("res://iso/scenes/game-over/heartbroke1.wav")
			$AudioStreamPlayer.play()
		60:
			$Camera.scroller_zoom = 0.6
			$Heart.frame = 1
			$Camera.scrollershake = 6
		80:
			$AudioStreamPlayer.stream = load("res://iso/scenes/game-over/heartbroke2reversed.wav")
			$AudioStreamPlayer.play()
		117:
			$AudioStreamPlayer.stream = load("res://iso/scenes/game-over/heartbroke2.wav")
			$AudioStreamPlayer.play()
		120:
			$Camera.scroller_zoom = 0.6
			$Camera.scrollershake = 6
			$Camera.scrollerspeed = 0.05
			$Heart.visible = 0
			dir = 1
			broke()
			dir = 0
			broke()
			dir = 1
			broke()
			dir = 0
			broke()
