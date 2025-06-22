class_name AudioInstance

var _stream_player: AudioStreamPlayer

signal stopped(stream_player: AudioStreamPlayer)


func _init(stream_player: AudioStreamPlayer):
	_stream_player = stream_player


func dispose():
	finish()


func play():
	play_impl()
	var stream_player = await stopped

	return stream_player


func play_impl():
	if _stream_player == null:
		finish()
		return

	_stream_player.play()
	await _stream_player.finished
	finish()


func finish():
	var stream_player = _stream_player
	_stream_player = null
	if stream_player != null:
		stream_player.stop()
		stopped.emit(stream_player)
