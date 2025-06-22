class_name ControlPositionProvider extends PositionProvider

var _control: Control


func _init(control: Control) -> void:
	_control = control


func get_position() -> Vector3:
	if _control == null:
		return Vector3.ZERO

	return PositionExtension.to_vector3(_control.global_position)
