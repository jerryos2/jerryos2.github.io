extends Node2D


onready var player = $Player
onready var score = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	set_player()
	score.set_score(ConfigManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_player():
#	var rng = RandomNumberGenerator.new()
#	rng.randomize()
#	var n = rng.randi_range(1, 9)
	var n = ConfigManager.get_player_id()
#	print("player id: {id}".format({"id": n}))
	player.play_animation(n)


func _on_CharacterSelect_pressed():
	SceneSwitcher.change_scene(SceneSwitcher.SELECT_SCENE)


func _on_TextureButton_pressed():
	SceneSwitcher.change_scene(SceneSwitcher.GAME_SCENE)


