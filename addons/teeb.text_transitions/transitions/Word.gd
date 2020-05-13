tool
extends "res://addons/teeb.text_transitions/transitions/TransitionBase.gd"


# Syntax: [word][/word]
var bbcode = "word"


const SPLITTERS = [ord(" "), ord("."), ord(",")]


var _index = 0
var _last = 999


func _process_custom_fx(char_fx):
	if char_fx.absolute_index < _last or char_fx.character in SPLITTERS:
		_index = char_fx.absolute_index
	
	_last = char_fx.absolute_index
	var tween_data = get_tween_data(char_fx)
	var t = 1.0 - tween_data.get_t(_index)
	char_fx.color.a *= t
	return true
