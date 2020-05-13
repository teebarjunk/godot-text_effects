tool
extends RichTextEffect


# Syntax: [uwu][/uwu]
var bbcode = "uwu"


const r = ord("r")
const R = ord("R")
const l = ord("l")
const L = ord("L")

const w = ord("w")
const W = ord("W")


func _process_custom_fx(char_fx):
	match char_fx.character:
		r, l: char_fx.character = w
		R, L: char_fx.character = W
	return true
