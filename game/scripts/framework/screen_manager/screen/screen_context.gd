class_name ScreenContext extends Resource


func create_loader(
	container: Node
) -> BaseScreenLoaderController:
	return _create_loader(container)


func create_screen(
	ui_container: Node,
	world_container: Node,
) -> ScreenBaseController:
	return _create_screen(ui_container, world_container)


func _create_loader(
	container: Node
) -> BaseScreenLoaderController:
	return BaseScreenLoaderController.new()


func _create_screen(
	ui_container: Node,
	world_container: Node,
) -> ScreenBaseController:
	return null
