extends KinematicBody2D

export(bool) var opening = false setget set_opening

func set_opening(value):
	opening = value
	if opening:
		collision_layer = 2
		collision_mask = 2
		$Wood.visible = false
	else:
		collision_layer = 1
		collision_mask = 1
		$Wood.visible = true
