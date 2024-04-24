extends Node2D


onready var animation = $PlayerAnimation


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func play_animation(kind: int):
	animation.play("anim-{n}".format({"n": kind}))

func die():
	animation.play("die")
