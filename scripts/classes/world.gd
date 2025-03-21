
class_name World extends Node3D

var VisualPlanet
var HiddenPlanet
var Rotation_Speed : float
var joystick
var CharacterSpeed : float = .5
var _axis : Vector3 = Vector3.UP


func _enter_tree() -> void:
	PlanetInit()
	JoystickInit()

func JoystickInit():
	joystick = preload("res://scenes/joy_stick.tscn").instantiate()
	add_child(joystick)
	joystick.position = Vector2(
		DisplayServer.window_get_size().x /2,
		DisplayServer.window_get_size().y - 200
	)

func PlanetInit():
	VisualPlanet = preload("res://scenes/planet.tscn").instantiate()
	add_child(VisualPlanet)
	VisualPlanet.name = "VisualPlanet"
	VisualPlanet.planet_type = PlanetType.PlanetType.Visual
	VisualPlanet.MakeThisPlanetVisual()
	
	HiddenPlanet = VisualPlanet.duplicate()
	add_child(HiddenPlanet)
	HiddenPlanet.planet_type = PlanetType.PlanetType.Hidden
	HiddenPlanet.name = "HiddenPlanet"
	HiddenPlanet.MakeThisPlanetHidden()
	
	
func _process(delta: float) -> void:
	CalculateRotationAxis(delta)
	CalculateBlocksMovement()


func CalculateRotationAxis(delta):
	if joystick.out_velocity.length() > 0:
		_axis =_axis.lerp(Vector3(joystick.out_velocity.x  ,0 ,  joystick.out_velocity.y).cross(Vector3.UP) , delta * 4)
		Rotation_Speed =lerpf(Rotation_Speed ,joystick.out_velocity.length() * delta * CharacterSpeed,delta * 4)
	else:
		Rotation_Speed =lerpf(Rotation_Speed ,0,delta * 4)
	VisualPlanet.rotate(_axis.normalized() , Rotation_Speed)
	HiddenPlanet.rotate(_axis.normalized() , Rotation_Speed)
	
func CalculateBlocksMovement():
	for floor in HiddenPlanet.get_node("Floors").get_children():
		if floor.global_position.distance_to(Vector3.UP) < 1.2:
			VisualPlanet.get_node("Floors").get_node(str(floor.name)).rise()
			
		else:
			VisualPlanet.get_node("Floors").get_node(str(floor.name)).godown()
			
	for closedwall in HiddenPlanet.get_node("Walls").get_node("ClosedWalls").get_children():
		
		if closedwall.global_position.distance_to(Vector3.UP) < 1.2:
			VisualPlanet.get_node("Walls").get_node("ClosedWalls").get_node(str(closedwall.name)).rise()
			
		else:
			VisualPlanet.get_node("Walls").get_node("ClosedWalls").get_node(str(closedwall.name)).godown()
			
			
	for openwall in HiddenPlanet.get_node("Walls").get_node("OpenWalls").get_children():
		
		if openwall.global_position.distance_to(Vector3.UP) <1.2:
			VisualPlanet.get_node("Walls").get_node("OpenWalls").get_node(str(openwall.name)).rise()
			
		else:
			VisualPlanet.get_node("Walls").get_node("OpenWalls").get_node(str(openwall.name)).godown()
