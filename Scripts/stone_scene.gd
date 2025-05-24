extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var isOpen = false
var inRange = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") && inRange:
		if !isOpen:
			isOpen = true
			animation_player.play("open")
			GlobalSignal.open_stone.emit($Area3D/CollisionShape3D.global_position)
		else:
			isOpen = false
			animation_player.play_backwards("open")
			GlobalSignal.close_stone.emit()

func _on_area_3d_body_entered(body: Node3D) -> void:
	inRange = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	inRange = false
