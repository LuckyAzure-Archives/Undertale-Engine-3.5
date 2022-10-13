extends Light2D

func _process(_delta):
	scale = get_parent().get_parent().get_node("Box/BattleBox").scrollersize
	rotation_degrees = get_parent().get_parent().get_node("Box/BattleBox").scrollerangle
	position = get_parent().get_parent().get_node("Box/BattleBox").scroller
