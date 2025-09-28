extends Node3D
signal state_changed(state)
enum State { WALK, LOOK }
@export var state = State.WALK

func _ready() -> void:
	GlobalSignal.open_stone.connect(state_to_look)
	GlobalSignal.close_stone.connect(state_to_walk)

func set_state(new_state):
	state = new_state
	emit_signal("state_changed", state)
	print_debug(state)
	

func state_to_look(_position: Vector3, _sound: AudioStreamMP3, _still_sound: AudioStreamMP3) -> void:
	set_state("LOOK")

func state_to_walk(_sound: AudioStreamMP3) -> void:
	set_state("WALK")
