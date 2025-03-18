extends Node3D


class_name GBPolyhedron


func _process(delta: float) -> void:
	$Planet.rotate(Vector3.UP , .005)
	$Planet.rotate(Vector3.RIGHT , .005)
	
	
	$HiddenPlanet.rotate(Vector3.UP , .005)
	$HiddenPlanet.rotate(Vector3.RIGHT , .005)
	
	for gon in $HiddenPlanet/Floors.get_children():
		if gon.global_position.distance_to(Vector3.ZERO) < 1.2:
			$Planet/Floors.get_node(str(gon.name)).rise()
			
		else:
			$Planet/Floors.get_node(str(gon.name)).godown()
