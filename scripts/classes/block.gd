extends MeshInstance3D


class_name block

var RestPosition
var RestScale : Vector3
var HiddenPosition : Vector3 = Vector3.ZERO
var tween : Tween
var TravelSpeed : float = .1


func _ready() -> void:
	RestPosition = position
	

func rise():
	tween = get_tree().create_tween()
	tween.tween_property(self , "position" , RestPosition , TravelSpeed).set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self , "scale" , RestScale , TravelSpeed).set_trans(Tween.TRANS_LINEAR)
	#tween.finished.connect(on_rise)
	
	
func godown():
	tween = get_tree().create_tween()
	tween.tween_property(self , "position" , HiddenPosition , TravelSpeed).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self , "scale" , Vector3.ZERO , TravelSpeed * .1)

func on_rise():
	print("block " , name , " rised")
