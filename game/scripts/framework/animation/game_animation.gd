class_name GameAnimation

var _is_finished: bool

signal finished


func finish():
	_is_finished = true
	finished.emit()


func is_finished():
	return _is_finished
