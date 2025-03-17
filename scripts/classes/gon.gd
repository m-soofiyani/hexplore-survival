extends MeshInstance3D


class_name Gon

var RestPosition
var HiddenPosition : Vector3 = Vector3.ZERO
var tween : Tween
var TravelSpeed : float = .3

func _ready() -> void:
	RestPosition = position
	

func rise():
	tween = get_tree().create_tween()
	tween.tween_property(self , "position" , RestPosition , TravelSpeed).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self , "scale" , Vector3.ONE , TravelSpeed).set_trans(Tween.TRANS_CIRC)
	
	
func godown():
	tween = get_tree().create_tween()
	tween.tween_property(self , "position" , HiddenPosition , TravelSpeed).set_trans(Tween.TRANS_CIRC)
	tween.tween_property(self , "scale" , Vector3.ZERO , TravelSpeed * .1)
