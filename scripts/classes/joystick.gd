class_name JoyStick extends Node2D


@onready var joystick_circle_frame: Sprite2D = $JoystickCircleFrame
@onready var joystick_circle: Sprite2D = $JoystickCircleFrame/JoystickCircle

var input_velocity : Vector2
@export var out_velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	out_velocity = input_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event: InputEvent) -> void:
	
	if event is InputEventScreenDrag:
		

		var origin = joystick_circle_frame.position
		var distance = origin.distance_to((event.position - self.position))
		distance = clampf(distance , 0 ,70)
		
		joystick_circle.position = (event.position - self.position).normalized() * distance
		input_velocity = (joystick_circle.position - origin).normalized()

			
		
	elif event is InputEventScreenTouch and event.is_released():

		joystick_circle.position = Vector2.ZERO
		input_velocity = Vector2.ZERO
	
