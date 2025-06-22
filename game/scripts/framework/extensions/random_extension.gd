class_name RandomExtension


static func random_array_item(array: Array):
	var index := randi_range(0, array.size() - 1)

	return array[index]


static func sign() -> int:
	return 1 if randf() > 0.5 else -1


static func random_bool() -> int:
	return randf() > 0.5
