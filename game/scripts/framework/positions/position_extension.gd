class_name PositionExtension


static func to_vector3(from: Vector2, z: float = 0.0) -> Vector3:
	return Vector3(from.x, from.y, z)


static func to_vector2(from: Vector3) -> Vector2:
	return Vector2(from.x, from.y)
