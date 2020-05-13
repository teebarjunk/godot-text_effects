tool
extends Node


var transitions = {}


func register(rich_text_transition):
	transitions[rich_text_transition.id] = rich_text_transition


func unregister(rich_text_transition):
	transitions.erase(rich_text_transition.id)

#
#func tween_in(id:String, rt:RichTextLabel, time:float=1.0, time_per_character:bool=false, fade_distance:float=8.0, all_together:bool=false):
#	var d = transitions[id]
#	d.total_characters = len(rt.text)
#	d.backwards = false
#	d.fade_distance = fade_distance
#	d.all_together = all_together
#	var t = time if not time_per_character else time * len(rt.text)
#	var tw = rt.get_node("Tween")
#	tw.stop_all()
#	tw.interpolate_property(d, "time", 0.0, 1.0, t)
#	tw.start()
#
#
#func tween_out(id:String, rt:RichTextLabel, time:float=1.0, time_per_character:bool=false, fade_distance:float=8.0, all_together:bool=false):
#	var d = transitions[id]
#	d.total_characters = len(rt.text)
#	d.backwards = true
#	d.fade_distance = fade_distance
#	d.all_together = all_together
#	var t = time if not time_per_character else time * len(rt.text)
#	var tw = rt.get_node("Tween")
#	tw.stop_all()
#	tw.interpolate_property(d, "time", 1.0, 0.0, t)
#	tw.start()
