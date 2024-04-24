extends Node

const SELECT_SCENE = "res://scenes/select/Select.tscn"
const HOME_SCENE = "res://scenes/home/Home.tscn"
const GAME_SCENE = "res://scenes/game/Game.tscn"

# Private variable
var _params = null

# Call this instead to be able to provide arguments to the next scene
func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene(next_scene)

# In the newly opened scene, you can get the parameters by name
func get_param(name):
	if _params != null and _params.has(name):
		return _params[name]
	return null