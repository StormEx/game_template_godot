class_name SceneExtension


static func instantiate_by_path(
	scene_path: String,
	container: Node
):
	var res = load(scene_path)
	var view = res.instantiate()
	container.add_child(view)

	return view


static func instantiate_by_node(
	scene: Node,
	container: Node
):
	return instantiate(scene, container)


static func instantiate(
	obj,
	container: Node
):
	var view = obj.instantiate()
	container.add_child(view)

	return view
