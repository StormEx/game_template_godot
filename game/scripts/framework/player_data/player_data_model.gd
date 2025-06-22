class_name PlayerDataModel extends Object

const _file_name: String = "user://PlayerData.res"

var _user_data: PlayerDataDefinition
var _common_data: CommonPlayerDataPart

signal data_changed


func _init() -> void:
	_load()
	#reset_progress()


func reset_progress() -> void:
	save()


func save() -> void:
	ResourceSaver.save(_user_data, _file_name)


func save_and_notify() -> void:
	save()
	data_changed.emit()


func _initialize_common_part() -> void:
	_common_data = get_data_part("common")
	if _common_data == null:
		_common_data = CommonPlayerDataPart.new()
		add_data_part(_common_data)


func add_data_part(
	part: PlayerDataPart
) -> void:
	assert(not _user_data.parts.has(part.get_id()), "data %s part already exists" % part.get_id())

	_user_data.parts[part.get_id()] = part
	part.changed.connect(_on_part_changed)

	save()


func remove_data_part(
	part: PlayerDataPart
) -> void:
	var id := part.get_id()
	if _user_data.parts.has(id):
		var data_part := _user_data.parts[id]
		data_part.changed.disconnect(_on_part_changed)
		_user_data.parts.erase(id)

	save()


func get_data_part(
	id: String
) -> PlayerDataPart:
	if _user_data.parts.has(id):
		return _user_data.parts[id]

	return null


func is_music_muted() -> bool:
	return _common_data.is_music_muted


func set_is_music_muted(is_muted: bool) -> void:
	if _common_data.is_music_muted == is_muted:
		return

	_common_data.is_music_muted = is_muted
	save_and_notify()


func is_sound_muted() -> bool:
	return _common_data.is_sound_muted


func set_is_sound_muted(is_muted: bool) -> void:
	if _common_data.is_sound_muted == is_muted:
		return

	_common_data.is_sound_muted = is_muted
	save_and_notify()


func is_vibro_muted() -> bool:
	return _common_data.is_vibro_muted


func set_is_vibro_muted(is_muted: bool) -> void:
	if _common_data.is_vibro_muted == is_muted:
		return

	_common_data.is_vibro_muted = is_muted
	save_and_notify()


func _load() -> void:
	if ResourceLoader.exists(_file_name):
		_user_data = ResourceLoader.load(_file_name)
	else:
		_user_data = PlayerDataDefinition.new()


func _on_part_changed() -> void:
	save_and_notify()
