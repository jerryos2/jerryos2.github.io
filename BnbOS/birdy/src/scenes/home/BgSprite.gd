extends Sprite

var kind_of_background = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	set_background_img()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_background_img():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	kind_of_background = rng.randi_range(1, 6)
	match kind_of_background:
		1:
			texture = preload("res://assets/background/1.png")
		2:
			texture = preload("res://assets/background/2.png")
		3:
			texture = preload("res://assets/background/3.png")
		4:
			texture = preload("res://assets/background/4.png")
		5:
			texture = preload("res://assets/background/5.png")
		6:
			texture = preload("res://assets/background/6.png")
		_:
			texture = preload("res://assets/background/1.png")

func has_ceil() -> bool:
	return kind_of_background == 3 or kind_of_background == 6
