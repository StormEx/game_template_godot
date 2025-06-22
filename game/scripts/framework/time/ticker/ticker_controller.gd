class_name TickerController extends Updatable

var _min: float
var _max: float
var _current: float
var _is_enabled: bool = true

signal execute_requested


func _init(
	min: float,
	max: float
) -> void:
	_min = min
	_max = max

	generate_next_current()
	GameContext.get_time_manager().AddUpdatable(self)


func dispose() -> void:
	GameContext.get_time_manager().RemoveUpdatable(self)


func update(dt: float) -> void:
	if !_is_enabled:
		return

	if _current <= 0:
		execute_requested.emit()
		generate_next_current()
	else:
		_current -= dt

		if _current <= 0:
			execute_requested.emit()
			generate_next_current()


func generate_next_current() -> void:
	_current = randf_range(_min, _max)


func set_enable(is_enabled: bool) -> void:
	_is_enabled = is_enabled
