class_name GameScreenContext extends CommonScreenContext


func _create_screen(
	ui_container: Node,
	world_container: Node,
) -> ScreenBaseController:
	return GameScreenController.new(
		screen_scene,
		ui_container,
		world_container)
