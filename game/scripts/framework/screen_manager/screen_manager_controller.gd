class_name ScreenManagerController

var _view: ScreenManagerView
var _current_screen: ScreenBaseController = null


func _init(
	scene: PackedScene,
	container: Node
) -> void:
	_view = SceneExtension.instantiate(scene, container)


func dispose() -> void:
	dispose_current_screen()


func dispose_current_screen() -> void:
	if _current_screen != null:
		_current_screen.dispose()
		_current_screen = null;


func start_default() -> void:
	start_menu(_view.start_screen_context)


func start_menu(
	context: ScreenContext
) -> void:
	var loader = context.create_loader(_view.loader_container) 
	await loader.show_async()
	dispose_current_screen()
	_current_screen = context.create_screen(_view.scene_container, _view.world_container)
	await _current_screen.load_async()
	await loader.hide_async()
	loader.dispose()
	loader = null

	_current_screen.run()
