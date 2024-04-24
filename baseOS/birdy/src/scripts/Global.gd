extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func window_size() -> Vector2:
#	var vec = OS.window_size
	var vec = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
#	print("window_size x:{x} y:{y}".format({"x": vec.x, "y": vec.y}))
	return vec

func is_ios() -> bool:
	return OS.get_name() == 'iOS'

func is_android() -> bool:
	return OS.get_name() == 'Android'
