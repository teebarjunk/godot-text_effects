tool
extends RichTextLabel


export(String) var id:String = "main"
export(float, 0.0, 1.0) var time:float = 0.0
export(float, 1.0, 32.0) var length:float = 8.0
export(bool) var reverse:bool = false
export(bool) var all_at_once:bool = false
export(float, 0.1, 2.0) var animation_time:float = 1.0 


func _enter_tree():
	TextTransitionSettings.register(self)
	$AnimationPlayer.connect("animation_finished", self, "on_animation_finish")


func _exit_tree():
	TextTransitionSettings.unregister(self)
	$AnimationPlayer.disconnect("animation_finished", self, "on_animation_finish")


# Mostly needed for editor testing.
func _process(delta):
	if not id in TextTransitionSettings.transitions:
		TextTransitionSettings.register(self)


func on_animation_finish(anim_name:String):
	match anim_name:
		"fade_in": prints("Faded in.", self.name)
		"fade_out": prints("Faded out.", self.name)


func fade_in():
	$AnimationPlayer.play("fade_in", -1, animation_time)


func fade_out():
	$AnimationPlayer.play("fade_out", -1, animation_time)


# char_index: Character position requesting a time value.
# allow_all_together: used internally by some transitions.
func get_t(char_index:int, allow_all_together:bool = true) -> float:
	if all_at_once and allow_all_together:
		return 1.0 - time
	else:
		var characters = get_total_character_count() + length
		if reverse:
			var t = (1.0 - time) * characters
			return 1.0 - clamp((char_index + length - t), 0.0, length) / length
		else:
			var t = time * characters
			return clamp((char_index + length - t), 0.0, length) / length
