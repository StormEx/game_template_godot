class_name ScreenBaseController


func run() -> void:
	GameContext.exit_requested.connect(_on_exit_requested)
	_create_and_run()
	GameContext.exit_requested.disconnect(_on_exit_requested)


func dispose() -> void:
	_dispose_internal()


func _dispose_internal() -> void:
	pass


func load_async() -> void:
	await _load_async()


func _load_async() -> void:
	pass


func _create_and_run() -> void:
	pass


func _on_exit_requested() -> void:
	pass
