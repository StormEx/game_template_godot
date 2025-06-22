class_name SlomoController

var _data: SlomoData
var _tween: Tween
var _is_stopped: bool


func _init(data: SlomoData) -> void:
	_data = data


func dispose() -> void:
	_is_stopped = true
	Engine.time_scale = 1
	ShaderTimeAnimation.set_shader_animation_time(1.0)

	if _tween == null:
		return
	_tween.kill()


func start_async() -> void:
	for d in _data.step_collection:
		await tween_time_scale(d)


func pause() -> void:
	if _tween != null:
		_tween.pause()
	Engine.time_scale = 1
	ShaderTimeAnimation.set_shader_animation_time(1.0)


func resume() -> void:
	if _tween != null:
		_tween.play()


func tween_time_scale(
	data: SlomoTweenData
) -> void:
	if _is_stopped:
		return

	_tween = GameContext.get_tree().create_tween()
	_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tween.set_ease(Tween.EASE_OUT)
	_tween.tween_method(Process, float(data.initial_value), float(data.target_value), data.duration).set_ease(data.ease).set_trans(data.trans)
	await _tween.finished
	if _tween == null:
		return
	_tween.kill()


func Process(value: float) -> void:
	ShaderTimeAnimation.set_shader_animation_time(value)
	Engine.time_scale = value
