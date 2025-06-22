class_name TimeManager

var _updatables: Array[Updatable]
var _to_remove: Array[Updatable]


func dispose() -> void:
	_updatables.clear()
	_to_remove.clear()


func add_updatable(item: Updatable):
	_updatables.push_back(item)


func remove_updatable(item: Updatable):
	var index := _updatables.find(item)
	if index >= 0:
		_updatables.remove_at(index)


func update(dt: float):
	for i in _to_remove.size():
		remove_updatable(_to_remove[i])
	_to_remove.clear()

	var copy: Array[Updatable] = _updatables.duplicate()
	for i in copy.size():
		copy[i].update(dt)
