class_name GameScreenController extends ScreenBaseController

var _view: GameScreenView
var _world_container: Node


func _init(
	scene: PackedScene,
	container: Node,
	world_container: Node
) -> void:
	_world_container = world_container
	_view = SceneExtension.instantiate(scene, container)


func dispose() -> void:
	_view.queue_free()
	_view = null
