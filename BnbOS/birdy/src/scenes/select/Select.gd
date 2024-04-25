extends Node2D

var current_grid = 1
var num_grids = 6
var grid_width = 216
var is_tween_action = false

onready var tween = $Menu/Tween
onready var gridbox = $Menu/Center/Characters/GridBox


# Called when the node enters the scene tree for the first time.
func _ready():
	num_grids = gridbox.get_child_count()
	grid_width = gridbox.rect_size.x / num_grids
	current_grid = ConfigManager.get_player_id()
	if 1 < current_grid:
#		gridbox.rect_position.x - (grid_width * (current_grid - 1))
		tween.interpolate_property(gridbox, "rect_position:x",
				null, gridbox.rect_position.x - (grid_width * (current_grid - 1)),
				0, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
		is_tween_action = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ApplyBtn_pressed():
	ConfigManager.save_player_id(current_grid)
	SceneSwitcher.change_scene(SceneSwitcher.HOME_SCENE)


func _on_PreBtn_pressed():
	if !is_tween_action and current_grid > 1:
		current_grid -= 1
#		gridbox.rect_position.x += grid_width
		tween.interpolate_property(gridbox, "rect_position:x",
				null, gridbox.rect_position.x + grid_width,
				0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
		is_tween_action = true


func _on_NextBtn_pressed():
	if !is_tween_action and current_grid < num_grids:
		current_grid += 1
#		gridbox.rect_position.x -= grid_width
		tween.interpolate_property(gridbox, "rect_position:x",
				null, gridbox.rect_position.x - grid_width,
				0.5, Tween.TRANS_BACK, Tween.EASE_OUT)
		tween.start()
		is_tween_action = true
	


func _on_Tween_tween_completed(object, key):
	is_tween_action = false
