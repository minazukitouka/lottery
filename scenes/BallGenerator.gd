extends Node

export(PackedScene) var ball_scene
export(NodePath) var generation_position
export(Array, String) var denominators

onready var timer = $Timer
var generated_balls = 0

const random_area_size = 100

func _ready():
	randomize()
	denominators.shuffle()
	timer.connect('timeout', self, 'generate_next_ball')

func generate_next_ball():
	if generated_balls >= denominators.size():
		return
	var denominator = denominators[generated_balls]
	generate_ball(denominator)
	generated_balls += 1

func generate_ball(nickname):
	var generation_position_node = find_node(generation_position)
	var ball = ball_scene.instance()
	ball.nickname = nickname
	ball.global_position = generation_position_node.global_position
	ball.global_position.x += rand_range(-random_area_size, random_area_size)
	ball.global_position.y += rand_range(-random_area_size, random_area_size)
	add_child(ball)
