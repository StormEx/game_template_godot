class_name Node3DGlobalPositionAssigner extends PositionAssigner

var _node: Node


func _init(node: Node) -> void:
	_node = node


func SetPosition(position: Vector3) -> void:
	if _node == null:
		return

	_node.global_position = position


func SetScale(scale: float) -> void:
	if _node == null:
		return

	_node.scale = scale * Vector3.ONE
