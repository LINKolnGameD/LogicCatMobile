extends Node
#var global_level_info

signal furniture_info(info)
#signal what_level(level)
signal scene_change_requested(scene)
signal add_succes(level)
signal add_very_succes(level)
signal level_choice(level)
signal if_need_education(level)
signal change_sound_first()
signal change_sound_second()
signal play_button_sound()
signal music_change()

var music: bool = true
var sound: bool = true

func _ready():
#	what_level.connect(keep_level)
	pass
#func keep_level(level_number):
#	global_level_info = level_number
