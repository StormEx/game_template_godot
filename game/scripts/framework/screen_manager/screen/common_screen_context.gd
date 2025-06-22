class_name CommonScreenContext extends ScreenContext

@export var screen_scene: PackedScene
@export var loader_scene: PackedScene


func _create_loader(
	container: Node
) -> BaseScreenLoaderController:
	return ScreenLoaderController.new(loader_scene, container)
