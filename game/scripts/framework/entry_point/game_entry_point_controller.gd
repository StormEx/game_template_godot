class_name GameEntryPointController extends Object

var _view: GameEntryPointView
var _screen_manager_controller: ScreenManagerController


func _init(view: GameEntryPointView):
	_view = view

	_screen_manager_controller = ScreenManagerController.new(
		_view.screen_manager_scene,
		_view.container
	)
	GameContext.initialize(_screen_manager_controller)
	_screen_manager_controller.start_default()
