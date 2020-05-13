tool
extends "res://addons/teeb.text_transitions/transitions/TransitionBase.gd"


# Syntax: [wfc][/wfc]
var bbcode = "wfc"


const ONE = ord("1")
const ZERO = ord("0")


func _process_custom_fx(char_fx):
	var t = 1.0 - get_t(char_fx)
	var r = get_rand(char_fx)
	var a = clamp(t * 2.0 - r * t, 0.0, 1.0)
	if a != 1.0 and char_fx.character != SPACE:
		char_fx.character = ZERO if sin(get_rand_time(char_fx, 16.0)) > 0.0 else ONE
		char_fx.color.r = 0.0
		char_fx.color.g = 0.0
		char_fx.color.b = 0.0
		a *= .5
	char_fx.color.a = t
	return true
