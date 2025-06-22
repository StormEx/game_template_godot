class_name NodeExtension


static func clear_node(node: Node):
	for i in node.get_child_count():
		node.get_child(i).queue_free()
