class_name Node3DLocalPositionAssigner extends PositionAssigner

var _node: Node


func _init(node: Node) -> void:
	_node = node


func set_position(position: Vector3) -> void:
	if _node == null:
		return

	_node.position = position


func set_scale(scale: float) -> void:
	if _node == null:
		return

	_node.scale = scale * Vector3.ONE
