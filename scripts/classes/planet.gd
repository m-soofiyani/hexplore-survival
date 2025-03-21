extends Node3D

class_name Planet

@export var planet_type : PlanetType.PlanetType

var generatedwall : Array
var ClosedWalls : Array
var OpenWalls : Array


func MakeThisPlanetVisual():
	GenerateRandomWalls()
	_Set_Script()
	
func MakeThisPlanetHidden():
	Detach_Script()
	MakeInvisible()


func  MakeInvisible():
	self.visible = false

	
		
func Detach_Script():
	
	for f in $Floors.get_children():
		f.set_script(null)
		
	for w_c in $Walls/ClosedWalls.get_children():
		w_c.set_script(null)
		
	for w_o in $Walls/OpenWalls.get_children():
		w_o.set_script(null)
		
func _Set_Script():
	for f in $Floors.get_children():
		f.set_script(preload("res://scripts/classes/block.gd"))
		f.RestScale = Vector3.ONE
		
	for w_c in $Walls/ClosedWalls.get_children():
		w_c.set_script(preload("res://scripts/classes/block.gd"))
		w_c.RestScale = Vector3.ONE * 100
		w_c.TravelSpeed = .16
		
	for w_o in $Walls/OpenWalls.get_children():
		w_o.set_script(preload("res://scripts/classes/block.gd"))
		w_o.RestScale = Vector3.ONE * 100
		w_o.TravelSpeed = .15
	
func GenerateRandomWalls():
	
	for i in range(120):
		var walls = [WallType.WallType.empty , WallType.WallType.closed , WallType.WallType.open]
		var rng = RandomNumberGenerator.new()
		var  weights = PackedFloat32Array([1,0.5,1])
		var wall = walls[rng.rand_weighted(weights)]
		
		match wall:
			WallType.WallType.empty:
				pass
			
			WallType.WallType.closed:
				$Walls/ClosedWalls.get_node("closed"+str(i)).visible = true
				ClosedWalls.append($Walls/ClosedWalls.get_children()[i])
				pass
			
			WallType.WallType.open:
				$Walls/OpenWalls.get_node("open"+str(i)).visible = true
				OpenWalls.append($Walls/OpenWalls.get_children()[i])
				pass
		generatedwall.append(wall)
	#CleanWalls()


func CleanWalls():
	for wall in $Walls/ClosedWalls.get_children():
		if not wall.is_visible_in_tree():
			wall.queue_free()
			
	for wall in $Walls/OpenWalls.get_children():
		if not wall.is_visible_in_tree():
			wall.queue_free()
