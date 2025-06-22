class_name UnprojectPositionProvider extends PositionProvider

var _node: Node3D
var _camera: Camera3D


func _init(
	node: Node3D,
	camera: Camera3D) -> void:
	_node = node
	_camera = camera


func get_position() -> Vector3:
	if _node == null:
		return Vector3.ZERO

	return PositionExtension.to_vector3(_camera.unproject_position(_node.global_position))
