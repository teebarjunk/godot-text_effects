tool
extends RichTextEffect


# Syntax: [sparkle freq c1 c2 c3][/sparkle]
var bbcode = "sparkle"


static func lerp_list(a:Array, t:float):
	if len(a) == 0: return null
	if len(a) == 1: return a[0]
	t = wrapf(t, 0.0, 1.0)
	var scaled:float = t * float(len(a) - 1.0)
	var from = a[wrapi(int(floor(scaled)), 0, len(a))]
	var to = a[wrapi(int(floor(scaled + 1.0)), 0, len(a))]
	t = scaled - floor(scaled)
	return lerp(from, to, t)


func get_color(s) -> Color:
	if s is Color: return s
	elif s[0] == '#': return Color(s)
	else: return ColorN(s)


func get_rand_unclamped(char_fx):
	return char_fx.character * 33.33 + char_fx.absolute_index * 4545.5454


func _process_custom_fx(char_fx):
	var freq = char_fx.env.get("freq", 2.0)
	var c1 = char_fx.env.get("c1", char_fx.color)
	var c2 = char_fx.env.get("c2")
	var c3 = char_fx.env.get("c3")

	var colors = []
	if c1 != null: colors.append(get_color(c1))
	if c2 != null: colors.append(get_color(c2))
	if c3 != null: colors.append(get_color(c3))

	if len(colors) != 0:
		var t = sin(char_fx.elapsed_time * freq + get_rand_unclamped(char_fx)) * .5 + .5
		char_fx.color = lerp_list(colors, t)
	return true
