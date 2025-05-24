extends Node3D
signal state_changed(state)
enum State { WALK, LOOK }
@export var state = State.WALK

func _ready() -> void:
	GlobalSignal.open_stone.connect(state_to_look)
	GlobalSignal.close_stone.connect(set_state.bind("WALK"))

func set_state(new_state):
	state = new_state
	emit_signal("state_changed", state)
	print_debug(state)
	

func state_to_look(_position: Vector3) -> void:
	set_state("LOOK")
