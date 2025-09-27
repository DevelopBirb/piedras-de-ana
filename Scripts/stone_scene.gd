extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var open_sound: AudioStreamMP3 
@export var close_sound: AudioStreamMP3
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

var isOpen = false
var inRange = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") && inRange:
		if !isOpen:
			isOpen = true
			animation_player.play("open")
			GlobalSignal.open_stone.emit($Area3D/CollisionShape3D.global_position, open_sound)
		else:
			isOpen = false
			animation_player.play_backwards("open")
			GlobalSignal.close_stone.emit(close_sound)

func _on_area_3d_body_entered(body: Node3D) -> void:
	inRange = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	inRange = false
