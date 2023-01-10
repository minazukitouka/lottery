extends RigidBody2D

export(String) var nickname setget set_nickname
export(NodePath) var name_path

func set_nickname(value):
	nickname = value
	find_node(name_path).text = nickname
