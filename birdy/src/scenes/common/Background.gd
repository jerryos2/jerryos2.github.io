extends Sprite

signal area_enterd

export var camera_velocity: Vector2 = Vector2( -50, 0 )

onready var parallax_background = $ParallaxBackground
onready var bg_sprite = $ParallaxBackground/ParallaxLayer/BgSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	parallax_background.camera_velocity = camera_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Floor_area_entered(area: Area2D):
	if area.name == "PlayerBody":
#		print("_on_Floor_area_entered")
		emit_signal("area_enterd")


func _on_Ceiling_area_entered(area: Area2D):
	if area.name == "PlayerBody" and bg_sprite.has_ceil():
#		print("_on_Ceiling_area_entered")
		emit_signal("area_enterd")


func _on_Ceiling2_area_entered(area: Area2D):
	if area.name == "PlayerBody":
#		print("_on_Ceiling2_area_entered")
		emit_signal("area_enterd")
