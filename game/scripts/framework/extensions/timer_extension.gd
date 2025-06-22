class_name TimerExtension


static func get_timer(
	delay_sec: float
):
	return GameContext.get_tree().create_timer(delay_sec)


static func delay(
	delay_sec: float
):
	if is_equal_approx(delay_sec, 0.0):
		return

	var timer = get_timer(delay_sec)
	await timer.timeout
