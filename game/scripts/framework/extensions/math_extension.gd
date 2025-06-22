class_name MathExtension


static func repeat(
	index: int,
	count: int
) -> int:
	var new_index := index % count
	if new_index < 0:
		new_index = count + new_index

	return new_index
