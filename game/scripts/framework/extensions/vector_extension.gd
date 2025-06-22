class_name VectorExtension


static func lerp_vector3(
	one: Vector3,
	two: Vector3,
	ratio: float
) -> Vector3:
	return lerp(one, two, ratio)


static func get_range_vector2(
	one: Vector2,
	two: Vector2
):
	return Vector2(
		randf_range(one.x, two.x),
		randf_range(one.y, two.y),
	)


static func get_range_vector3(
	one: Vector3,
	two: Vector3
):
	return Vector3(
		randf_range(one.x, two.x),
		randf_range(one.y, two.y),
		randf_range(one.z, two.z),
	)
