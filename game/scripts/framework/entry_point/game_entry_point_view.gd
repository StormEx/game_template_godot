class_name GameEntryPointView extends Node

@export var screen_manager_scene: PackedScene
@export var container: Node


func _ready():
	GameEntryPointController.new(self)
