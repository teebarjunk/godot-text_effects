extends RichTextEffect


const HALFPI = PI / 2.0
const SPACE = ord(" ")


func get_color(s) -> Color:
	if s is Color: return s
	elif s[0] == '#': return Color(s)
	else: return ColorN(s)


# Just a way to get a consistent seed value for randomized animations.
func get_rand(char_fx):
	return fmod(get_rand_unclamped(char_fx), 1.0)


func get_rand_unclamped(char_fx):
	return char_fx.character * 33.33 + char_fx.absolute_index * 4545.5454


func get_rand_time(char_fx, time_scale=1.0):
	return char_fx.character * 33.33 + char_fx.absolute_index * 4545.5454 + char_fx.elapsed_time * time_scale


func get_tween_data(char_fx):
	var id = char_fx.env.get("id", "main")
	if not id in TextTransitionSettings.transitions:
		prints("(TransitionBase) No RichTextTransition with id", id, "is registered.")
	else:
		return TextTransitionSettings.transitions[id]


func get_t(char_fx):
	return get_tween_data(char_fx).get_t(char_fx.absolute_index)
