extends Node3D


class_name Wall

@export var ClosedWalls : PackedScene
@export var OpenWalls : PackedScene


var generatedwall : Array

func _ready() -> void:
	GenerateRandomWalls()
	

func GenerateRandomWalls():
	
	for i in range(120):
		var wall = [WallType.WallType.empty , WallType.WallType.closed , WallType.WallType.open].pick_random()
		match wall:
			WallType.WallType.empty:
				print("wall" , i ," is empty")
				pass
			
			WallType.WallType.closed:
				$ClosedWalls.get_node("closed"+str(i)).visible = true
				
				pass
			
			WallType.WallType.open:
				print("wall" , i ,": is open")
				$OpenWalls.get_node("open"+str(i)).visible = true
				pass
		generatedwall.append(wall)
	

	
	
