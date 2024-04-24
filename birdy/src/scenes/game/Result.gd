extends Node2D

onready var score_board = $Panel/Control/VBoxContainer/Score
onready var best_score_board = $Panel/Control/VBoxContainer/BestScore
onready var animation = $AnimationPlayer

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	score_board.text = String(score)
	var best_score = ConfigManager.get_high_score() 
	if best_score < score:
		ConfigManager.save_high_score(score)
		best_score_board.text = String(score)
	else:
		best_score_board.text = String(best_score)
	animation.play("init")
	AudioManager.play(AudioManager.SOUND_GAME_OVER)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_BackButton_pressed():
	SceneSwitcher.change_scene(SceneSwitcher.HOME_SCENE)


func _on_ReplayButton_pressed():
	SceneSwitcher.change_scene(SceneSwitcher.GAME_SCENE)
