class_name TimeFormatExtension


static func hour_to_secs(hours: int = 1):
	return hours * 60 * 60


static func format_time_with_cut(time: int):
	return "99:99:99" if time >= hour_to_secs(100) else format_time(time)


static func smart_typed_format_time(
	time_sec: int
) -> String:
	if time_sec >= 3600:
		return format_time(time_sec, false, false, "{hours}H", "{minutes}M", "{seconds}S")
	return format_time(time_sec, true, true, "{hours}H", "{minutes}M", "{seconds}S")


static func smart_format_time(
	time_sec: int
) -> String:
	if time_sec >= 3600:
		return format_time(time_sec, false, false)
	return format_time(time_sec, true, true)


static func typed_format_time(
	time: int,
	is_with_seconds: bool = true,
	is_with_cut: bool = true
):
	return format_time(time, is_with_seconds, is_with_cut, "{hours}H", "{minutes}M", "{seconds}S")


static func format_time(
	time: int,
	is_with_seconds: bool = true,
	is_with_cut: bool = true,
	hours_format: String = "{hours}",
	minutes_format: String = "{minutes}",
	seconds_format: String = "{seconds}",
):
	var seconds = time % 60
	var minutes = (time % 3600 - seconds) / 60
	var hours = (time - minutes * 60 + seconds) / 3600
	
	var ret = ""
	var hours_text = hours_format.replace("{hours}", "%02d" % [hours])
	var minutes_text = minutes_format.replace("{minutes}", "%02d" % [minutes])
	var seconds_text = seconds_format.replace("{seconds}", "%02d" % [seconds])
	if is_with_seconds:
		ret = hours_text + ":" + minutes_text + ":" + seconds_text
	else:
		ret = hours_text + ":" + minutes_text
	if hours == 0 && is_with_cut:
		if is_with_seconds:
			ret = minutes_text + ":" + seconds_text
		else:
			ret = minutes_text
	
	return ret


static func format_in_hours(
	time_sec: int,
	single_postfix: String = "hour",
	multi_postfix: String = "hours"
):
	var hours = time_sec / (60 * 60)
	var val = int(hours)
	var rem = hours - val
	
	var ret = "%01d" % [val] if is_equal_approx(rem, 0) else "%01d.%01f" % [val, rem]
	var word = multi_postfix if val > 1 else single_postfix
	
	return ret + " " + word
