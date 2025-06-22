class_name StartScreenController extends ScreenBaseController

var _view: StartScreenView


func _init(
	scene: PackedScene,
	container: Node,
) -> void:
	_view = SceneExtension.instantiate(scene, container)
	_view.button.pressed.connect(_on_pressed)


func dispose() -> void:
	_view.button.pressed.disconnect(_on_pressed)
	_view.queue_free()
	_view = null


func _on_pressed() -> void:
	GameContext.get_screen_manager().start_menu(_view.game_screen_context)
