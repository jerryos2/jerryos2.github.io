extends Node


const PLAYER = "PLAYER"
const MANAGE_FILE = "user://manage.cfg"
const HIGH_SCORE = "high_score"
const SOUND = "sound"
const SELECT_PLAYER_ID = "select_player_id"

# Called when the node enters the scene tree for the first time.
func _ready():
#	save_high_score(0)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_player_id() -> int:
	var val = read_player_config(SELECT_PLAYER_ID)
	if val == 0:
		return 1
	return val

func save_player_id(id):
	save_player_config(SELECT_PLAYER_ID, id)
	
func is_sound_on() -> bool:
	return read_player_config(SOUND) == 1

func change_sound_status():
	var status = read_player_config(SOUND)
	if status == 1:
		save_player_config(SOUND, 0)
	else:
		save_player_config(SOUND, 1)

func get_high_score() -> int:
	return read_player_config(HIGH_SCORE)

func save_high_score(score):
	save_player_config(HIGH_SCORE, score)

func save_player_config(key, value):
	var config = ConfigFile.new()
	var err = config.load(MANAGE_FILE)
	if err != OK:
		printerr("can't open score file")
	config.set_value(PLAYER, key, value)
	config.save(MANAGE_FILE)

	
func read_player_config(key) -> int:
	var config = ConfigFile.new()
	var err = config.load(MANAGE_FILE)
	if err != OK:
		printerr("can't open score file")
		return 0
	return config.get_value(PLAYER, key, 0)
