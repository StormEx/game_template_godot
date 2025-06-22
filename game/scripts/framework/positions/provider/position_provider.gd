class_name PositionProvider


func get_position() -> Vector3:
	return Vector3.ZERO


func get_position2() -> Vector2:
	return PositionExtension.to_vector2(get_position())


func get_position3() -> Vector3:
	return get_position()
