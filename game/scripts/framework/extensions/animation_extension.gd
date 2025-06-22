class_name AnimationExtension


static func play_animation_async(
	animation_name: String,
	animation: AnimationPlayer,
	custom_blend: float = -1
) -> void:
	animation.play(animation_name, custom_blend)
	await animation.animation_finished


static func play_animation_backwards_async(
	animation_name: String,
	animation: AnimationPlayer,
	custom_blend: float = -1
) -> void:
	animation.play_backwards(animation_name, custom_blend)
	await animation.animation_finished


static func PlayAnimationFromRandomPositionAsync(
	animation_name: String,
	animation: AnimationPlayer,
	custom_blend: float = -1
) -> void:
	animation.play(animation_name, custom_blend)
	var pos := animation.current_animation_length * randf()
	animation.seek(pos)
	await animation.animation_finished
