class_name ScreenLoaderController extends BaseScreenLoaderController

var _view: ScreenLoaderView


func _init(
	scene: PackedScene,
	container: Node
) -> void:
	_view = SceneExtension.instantiate(scene, container);


func dispose() -> void:
	_view.queue_free()
	_view = null


func show_async() -> void:
	await _view.play_show_async()


func hide_async() -> void:
	await _view.play_hide_async()
