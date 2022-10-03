extends Node

var krtimer = 0

func _ready():
	$"Name".text = get_tree().get_current_scene().PlayerName

func _process(delta):
	$"LV Counter".text = str(get_tree().get_current_scene().LV)
	$"HP Bar".rect_size.x = 1.20 * get_tree().get_current_scene().HPmax
	$"HP Bar".max_value = get_tree().get_current_scene().HPmax
	$"HP Bar".value = get_tree().get_current_scene().HP
	$"HP Barb".rect_size.x = 1.20 * get_tree().get_current_scene().HPmax
	$"HP Barb".max_value = get_tree().get_current_scene().HPmax
	$"HP Barb".value = get_tree().get_current_scene().HPKR
	$"HP Counter".text = str(get_tree().get_current_scene().HP)
	$"Max HP Counter".text = str(get_tree().get_current_scene().HPmax)
	if get_tree().get_current_scene().HPTYPE == "":
		$"HP KR".visible = 0
		$"HP Barb".value = 0
		$"HP Counter".rect_position.x = $"HP Barb".margin_right + 48 - 38
		$"HP Slash".position.x = $"HP Barb".margin_right + 94 - 38
		$"Max HP Counter".rect_position.x = $"HP Barb".margin_right + 112 - 38
	else:
		if get_tree().get_current_scene().HP > get_tree().get_current_scene().HPKR:
			get_tree().get_current_scene().HPKR = get_tree().get_current_scene().HP
		if get_tree().get_current_scene().HP < get_tree().get_current_scene().HPKR:
			$"HP Counter".text = str(get_tree().get_current_scene().HPKR)
			$"HP Counter".modulate = Color(1,0,1,1)
			$"Max HP Counter".modulate = Color(1,0,1,1)
			$"HP Slash".modulate = Color(1,0,1,1)
		else:
			$"HP Counter".modulate = Color(1,1,1,1)
			$"Max HP Counter".modulate = Color(1,1,1,1)
			$"HP Slash".modulate = Color(1,1,1,1)
		$"HP KR".visible = 1
		$"HP KR".position.x = $"HP Barb".margin_right + 20
		$"HP Counter".rect_position.x = $"HP Barb".margin_right + 48
		$"HP Slash".position.x = $"HP Barb".margin_right + 94
		$"Max HP Counter".rect_position.x = $"HP Barb".margin_right + 112
		if krtimer > 0:
			krtimer -= 1
		if get_tree().get_current_scene().HPKR > get_tree().get_current_scene().HP and krtimer == 0:
			krtimer = 20
			if (get_tree().get_current_scene().HPKR - get_tree().get_current_scene().HP) < 10:
				krtimer += 40
			if (get_tree().get_current_scene().HPKR - get_tree().get_current_scene().HP) < 20:
				krtimer += 30
			if (get_tree().get_current_scene().HPKR - get_tree().get_current_scene().HP) < 30:
				krtimer += 15
			get_tree().get_current_scene().HPKR -= 1
