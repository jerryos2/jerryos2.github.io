extends Node2D

onready var player = $Player
onready var background = $Background
onready var score_board = $Score

export var jump_velocity = 1600
export var gravity = -1100.0

var jump = 0
var score = 0
var is_game_over = false

# Called when the node enters the scene tree for the first time.
func _ready():
	set_player()
	set_score_board()
	score_board.hide_title()
	set_jump()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_game_over:
		return
	player.position.y -= ((gravity + jump) * delta)
	if 0 < jump:
		jump -= (-gravity * delta)

func set_player():
	var n = ConfigManager.get_player_id()
	player.play_animation(n)

func _unhandled_input(event):
	if is_game_over:
		return
	if event is InputEventMouseButton:
		if event.pressed:
			set_jump()

	if event is InputEventScreenTouch:
		if event.pressed:
			set_jump()

func set_jump():
	jump = jump_velocity

func _on_Background_area_enterd():
	if is_game_over:
		return
	is_game_over = true
	player.die()
	var result = preload("res://scenes/game/Result.tscn").instance()
	result.score = score
	add_child(result)

func _on_Background_clear_line():
	if not is_game_over:
		AudioManager.play(AudioManager.SOUND_SCORE_UP)
		score += 1
		set_score_board()
	
func set_score_board():
	score_board.set_score(score)
	
func _on_Timer_timeout():
	var obstacle = preload("res://scenes/game/Obstacle.tscn").instance()
	obstacle.scroll_speed = background.camera_velocity.x
	obstacle.connect("area_enterd", self, "_on_Background_area_enterd")
	obstacle.connect("clear_line", self, "_on_Background_clear_line")
	add_child(obstacle)
