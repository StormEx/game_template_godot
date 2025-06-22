class_name AudioManagerController

var _player_count: int
var _audio_stream_players: Array[AudioStreamPlayer] = []
var _available_stream_players: Array[AudioStreamPlayer] = []
var _available_count: int
var _empty_instance: AudioInstance


func _init(
	player_count: int = 10
):
	_player_count = player_count
	_empty_instance = AudioInstance.new(null)

	create_audio_players()
	_available_stream_players.append_array(_audio_stream_players)
	_available_count = _available_stream_players.size()


func play(definition: AudioDefinition):
	var instance := play_internal(definition)
	wait_audio_instance(instance)

	return instance


func play_async(definition: AudioDefinition):
	await wait_audio_instance(play_internal(definition))


func play_internal(
	definition: AudioDefinition
) -> AudioInstance:
	if _available_count == 0:
		return _empty_instance

	var stream_player := _available_stream_players[_available_count - 1]
	_available_count -= 1

	stream_player.bus = definition.bus
	stream_player.volume_db = definition.volume_db
	stream_player.stream = definition.stream

	var instance := AudioInstance.new(stream_player)

	return instance


func wait_audio_instance(audio_instance: AudioInstance):
	var stream_player = await audio_instance.Play()
	if stream_player != null:
		return_to_play(stream_player)


func mute_music(is_muted: bool):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), -80 if is_muted else 0)


func mute_sfx(is_muted: bool):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), -80 if is_muted else 0)


func return_to_play(stream_player: AudioStreamPlayer):
	if stream_player == null:
		return

	var index := _available_stream_players.find(stream_player)
	if index < _available_count:
		return

	_available_stream_players[index] = _available_stream_players[_available_count]
	_available_stream_players[_available_count] = stream_player

	_available_count += 1


func create_audio_players():
	if _audio_stream_players.size() == 0:
		for i in _player_count:
			var asp := AudioStreamPlayer.new()
			GameContext.add_child(asp)
			_audio_stream_players.push_back(asp)
