class_name AudioDefinition extends Resource

@export var stream: AudioStream
@export var is_looped: bool = false
@export var is_one_shot: bool = true
@export_range(-80, 6) var volume_db: float = 0
@export var bus: String = "Sound"
