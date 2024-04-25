extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_sound_button()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_sound_button():
	if ConfigManager.is_sound_on():
		texture_normal = preload("res://assets/ui/ui.sprites/Music_ON.tres")
	else:
		texture_normal = preload("res://assets/ui/ui.sprites/Music_OFF.tres")

func _on_SoundButton_pressed():
	ConfigManager.change_sound_status()
	set_sound_button()
