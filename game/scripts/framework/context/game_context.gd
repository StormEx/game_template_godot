extends Node

var _time_manager: TimeManager
var _player_data_model: PlayerDataModel
var _audio_manager: AudioManagerController
var _screen_manager: ScreenManagerController
var _screen_size: Rect2
var _global_time: float
var _global_time_multiplier: float = 1.0


signal exit_requested
signal game_focus_out_requested
signal game_focus_in_requested


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func _process(delta: float) -> void:
	_time_manager.update(delta)
	_global_time += delta * _global_time_multiplier
	if _global_time > 10.0:
		_global_time -= 10.0
	RenderingServer.global_shader_parameter_set("global_time", _global_time)


func _input(event) -> void:
	if event is InputEventKey:
		var ke = event as InputEventKey
		if ke.is_action_pressed("ui_cancel"):
			exit_requested.emit()


func _notification(what) -> void:
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		exit_requested.emit()
	if what == NOTIFICATION_WM_WINDOW_FOCUS_IN:
		game_focus_in_requested.emit()
	if what == NOTIFICATION_WM_WINDOW_FOCUS_OUT:
		game_focus_out_requested.emit()


func initialize(
	screen_manager: ScreenManagerController
) -> void:
	_time_manager = TimeManager.new()
	_player_data_model = PlayerDataModel.new()
	_screen_size = get_viewport().get_visible_rect()
	_audio_manager = AudioManagerController.new()
	_screen_manager = screen_manager

	_initialize_internal()


func _initialize_internal() -> void:
	pass


func vibro(value: int = 40):
	if !_player_data_model.is_vibro_muted():
		Input.vibrate_handheld(value)


func set_global_time_multiplier(multiplier: float) -> void:
	_global_time_multiplier = multiplier
	if multiplier > 0:
		AudioServer.playback_speed_scale = _global_time_multiplier


func get_time_manager() -> TimeManager:
	return _time_manager


func get_audio_manager() -> AudioManagerController:
	return _audio_manager


func get_player_data_model() -> PlayerDataModel:
	return _player_data_model


func get_screen_manager() -> ScreenManagerController:
	return _screen_manager
