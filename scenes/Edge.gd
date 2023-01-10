extends Node2D

export(bool) var opening = false setget set_opening

onready var door = $Wood3

func set_opening(value):
	opening = value
	door.opening = opening
