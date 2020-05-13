tool
extends "res://addons/teeb.text_transitions/transitions/TransitionBase.gd"


# Syntax: [bounce][/bounce]
var bbcode = "bounce"


func bounce(t, wave=8.0) -> float:
	return sin(13.0 * HALFPI * t) * pow(2.0, wave * (t - 1.0))


func _process_custom_fx(char_fx):
	var t = get_t(char_fx)
	char_fx.offset.y = bounce(t, 8.0) * 8.0
	char_fx.color.a *= (1.0 - t)
	return true
