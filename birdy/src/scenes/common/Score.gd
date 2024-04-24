extends Node2D


onready var label = $Label
onready var title = $ScoreTitle


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func hide_title():
	title.hide()

func set_score(n: int):
	label.text = String(n)
