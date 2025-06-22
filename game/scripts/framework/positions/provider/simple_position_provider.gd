class_name SimplePositionProvider extends PositionProvider

var _position: Vector3


func _init(position: Vector3) -> void:
	_position = position


func get_position() -> Vector3:
	return _position
