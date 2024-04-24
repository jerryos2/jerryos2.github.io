extends ParallaxBackground

var camera_velocity: Vector2 = Vector2( 100, 0 )

onready var sprite = $ParallaxLayer/Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_offset: Vector2 = get_scroll_offset() + camera_velocity * delta
	set_scroll_offset( new_offset )


