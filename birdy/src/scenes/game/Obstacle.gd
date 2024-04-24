extends Node2D

signal area_enterd
signal clear_line

export var min_range = -230
export var max_range = 130

var scroll_speed = -100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_position_y()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += (scroll_speed * delta)
	if position.x <= -100:
		queue_free()

func set_position_y():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var n = rng.randi_range(min_range, max_range)
	position.y = n


func _on_Area2D_area_entered(area: Area2D):
	if area.name == "PlayerBody":
		emit_signal("area_enterd")


func _on_ClearLineArea_area_entered(area):
	if area.name == "PlayerBody":
		emit_signal("clear_line")
