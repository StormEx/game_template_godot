class_name StartScreenContext extends CommonScreenContext


func _create_loader(
	container: Node
) -> BaseScreenLoaderController:
	return BaseScreenLoaderController.new()


func _create_screen(
	ui_container: Node,
	world_container: Node,
) -> ScreenBaseController:
	return StartScreenController.new(screen_scene, ui_container)
