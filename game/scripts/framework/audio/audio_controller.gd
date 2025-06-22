class_name AudioController

var _definition: AudioDefinition
var _instance: AudioInstance


func _init(definition: AudioDefinition):
	_definition = definition


func dispose():
	cancel_play()


func play():
	cancel_play()

	_instance = GameContext.get_audio_manager().play(_definition)


func stop():
	cancel_play()


func cancel_play():
	if _instance != null:
		_instance.dispose()
		_instance = null
	
