extends Node2D

export(PackedScene) var edge_scene

const edge_count = 6
const lottery_size = 180

onready var timer = $Timer
onready var tween = $Tween

func _ready():
	for i in range(0, edge_count):
		var edge = edge_scene.instance()
		add_child(edge)
		edge.position = Vector2(
			lottery_size * cos(2 * PI * (i / float(edge_count))),
			lottery_size * sin(2 * PI * (i / float(edge_count)))
		)
		edge.rotation_degrees = 90 + i * (360 / edge_count)
	timer.connect('timeout', self, 'open_door')

func _input(event):
	if Input.is_action_just_pressed('close_door'):
		get_tree().get_nodes_in_group('edge')[0].opening = false
	if Input.is_action_just_pressed('open_door'):
		open_door_later()

func open_door_later():
	var wait_time = rand_range(1, 3)
	tween.interpolate_property(self, 'modulate', Color.red, Color.white, wait_time)
	tween.start()
	timer.wait_time = wait_time
	timer.start()

func open_door():
	get_tree().get_nodes_in_group('edge')[0].opening = true

func _process(delta):
	rotation_degrees -= delta * 100
