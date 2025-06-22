class_name PlayerDataPart extends Resource

var _id: String = "default"

signal part_changed


func invalidate() -> void:
	part_changed.emit()


func get_id() -> String:
	return _id
