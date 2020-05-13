tool
extends RichTextEffect


# Syntax: [colormod pow][/colormod]
var bbcode = "colormod"


func _process_custom_fx(char_fx):
	var t = smoothstep(0.3, 0.6, sin(char_fx.elapsed_time * 4.0) * .5 + .5)
	char_fx.color = lerp(char_fx.color, Color.blue, t)
	
#	char_fx.color.a -= RandUtil.noise(char_fx.elapsed_time * 8.0) * .5# sin(char_fx.elapsed_time * 16.0) * .5 + .5
#	var hsv = ColorUtil.color_to_hsv(char_fx.color)
#	hsv[0] += sin(char_fx.elapsed_time * 4.0) * .1
#	hsv[2] = sin(char_fx.elapsed_time * 8.0)
#	char_fx.color = char_fx.color.from_hsv(hsv[0], hsv[1], hsv[2], char_fx.color.a)
	return true
