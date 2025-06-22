class_name GlobalPositionProvider extends PositionProvider

var _node: Node


func _init(node: Node) -> void:
	_node = node


func get_position() -> Vector3:
	if _node == null:
		return Vector3.ZERO

	return _node.global_position
