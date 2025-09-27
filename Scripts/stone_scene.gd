extends Node3D

@export var open_sound: AudioStreamMP3 
@export var close_sound: AudioStreamMP3
@export var still_life_sound: AudioStreamMP3
@onready var animation_player_hinge: AnimationPlayer = $HingeScene/AnimationPlayerHinge

var isOpen = false
var inRange = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") && inRange:
		if !isOpen:
			isOpen = true
			if animation_player_hinge:
				animation_player_hinge.play("open")
			GlobalSignal.open_stone.emit($Area3D/CollisionShape3D.global_position, open_sound, still_life_sound)
		else:
			isOpen = false
			if animation_player_hinge:
				animation_player_hinge.play_backwards("open")
			GlobalSignal.close_stone.emit(close_sound)

func _on_area_3d_body_entered(body: Node3D) -> void:
	inRange = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	inRange = false
