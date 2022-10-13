extends ProgressBar

func _process(_delta):
	rect_position.x = int(get_tree().get_current_scene().get_node("Box/BattleBox").scroller.x - (get_tree().get_current_scene().get_node("Box/BattleBox").scrollersize.x * 0.5) + 230)
	rect_position.y = int(get_tree().get_current_scene().get_node("Box/BattleBox").scroller.y - (get_tree().get_current_scene().get_node("Box/BattleBox").scrollersize.y * 0.5) + 21)
	if get_tree().get_current_scene().get_node("Actions").Act_Fight == 1 and get_tree().get_current_scene().BossHPShow == true:
		visible = 1
	else:
		visible = 0
	value = get_tree().get_current_scene().BossHP
	max_value = get_tree().get_current_scene().BossHPMax
