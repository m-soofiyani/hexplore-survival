extends Node3D


class_name Wall

var openwalls : Dictionary
var closedwalls : Dictionary

func _ready() -> void:
	GenerateRandomWalls()
	

func GenerateRandomWalls():
	for wall in $OpenWalls.get_children():
		openwalls[wall.name] = wall.position
	
	for wall in $ClosedWalls.get_children():
		closedwalls[wall.name] = wall.position
	
	print(openwalls)
	print(closedwalls)
