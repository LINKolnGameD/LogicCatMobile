extends Node
var global_level_info

signal furniture_info(info)
signal what_level(level)

func _process(delta):
	what_level.connect(keep_level)
	print(global_level_info)
	
func keep_level(level_number):
	global_level_info = level_number
