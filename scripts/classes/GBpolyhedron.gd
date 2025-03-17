extends Node3D


class_name GBPolyhedron


func _process(delta: float) -> void:
	
	for gon in $Floors.get_children():
		if Input.is_action_just_pressed("ui_right"):
			gon.godown()

		if Input.is_action_just_pressed("ui_left"):
			gon.rise()
