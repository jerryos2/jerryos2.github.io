extends Node

const SOUND_CLICK = "res://assets/audio/click.mp3"
const SOUND_SCORE_UP = "res://assets/audio/score_up.mp3"
const SOUND_GAME_OVER = "res://assets/audio/game_over.mp3"

var num_players = 8
var bus = "master"

var available = []  # The available players.
var queue = []  # The queue of sounds to play.


func _ready():
	# Create the pool of AudioStreamPlayer nodes.
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", self, "_on_stream_finished", [p])
		p.bus = bus


func _on_stream_finished(stream):
	# When finished playing a stream, make the player available again.
	available.append(stream)


func play(sound_path):
	if ConfigManager.is_sound_on():
		queue.append(sound_path)


func _process(delta):
	# Play a queued sound if any players are available.
	if not queue.empty() and not available.empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
