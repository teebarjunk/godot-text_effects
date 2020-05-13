tool
extends RichTextEffect


# Syntax: [nervous scale=1.0 freq=8.0][/nervous]
var bbcode = "nervous"

const SPLITTERS = [ord(" "), ord("."), ord(","), ord("-")]

var _word = 0.0


func _process_custom_fx(char_fx):
	if char_fx.relative_index == 0:
		_word = 0
	
	var scale:float = char_fx.env.get("scale", 1.0)
	var freq:float = char_fx.env.get("freq", 8.0)

	if char_fx.character in SPLITTERS:
		_word += 1
	
	var s = fmod((_word + char_fx.elapsed_time) * PI * 1.25, PI * 2.0)
	var p = sin(char_fx.elapsed_time * freq)
	char_fx.offset.x += sin(s) * p * scale
	char_fx.offset.y += cos(s) * p * scale
	
	return true
