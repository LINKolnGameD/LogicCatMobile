class_name Card extends Control

@onready var Cat = $Cat
#@onready var OurArea = $Cat/CatAnSprite/Area2D

@onready var FirstPreference = $CatPreference
@onready var SecondPreference = $CatPreference2
@onready var ThirdPreference = $CatPreference3
@onready var MainScene = $"../../.."


@export var map: Node2D

#flag
var prefernces_sended: bool = false

#var mouse_into_us: bool = false
#var is_dragging: bool = false
#var can_be_picked: bool = true
#var in_interior: bool = false
#var furniture_position


func _ready():
	Cat.card = self
	Cat.map = map

func _process(_delta):
			
	if prefernces_sended == false:
		if $CatPreference.frame == 0 or $CatPreference2.frame == 0 or $CatPreference3.frame == 0:
			Cat.our_preferences.insert(0, 3)
		elif  $CatPreference.frame == 1 or  $CatPreference2.frame == 1 or $CatPreference3.frame == 1:
			Cat.our_preferences.insert(0, 1)
		else:
			Cat.our_preferences.insert(0, 2)
		if $CatPreference.frame == 2 or $CatPreference2.frame == 2 or $CatPreference3.frame == 2:
			Cat.our_preferences.insert(1, 3)
		elif  $CatPreference.frame == 3 or  $CatPreference2.frame == 3 or $CatPreference3.frame == 3:
			Cat.our_preferences.insert(1, 1)
		else:
			Cat.our_preferences.insert(1, 2)
		if $CatPreference.frame == 4 or $CatPreference2.frame == 4 or $CatPreference3.frame == 4:
			Cat.our_preferences.insert(2, 3)
		else:
			Cat.our_preferences.insert(2, 2)
		prefernces_sended = true
	
#	#print(furniture_position)
#
#	if Input.is_action_just_released("click"):
#		is_dragging = false
#	elif Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
#		if can_be_picked:
#			if mouse_into_us == true:
#				is_dragging = true
#	if is_dragging:
#			Cat.global_position = get_viewport().get_mouse_position()
#	if in_interior:
#		Cat.reparent($"../../../..")
#		Cat.velocity = Vector2(Cat.global_position.direction_to(furniture_position)) * 100
#	else:
#		Cat.reparent($".")
#		Cat.velocity = Vector2(Cat.global_position.direction_to($".".global_position)) * 100
#
#	Cat.move_and_slide()
	
#func _on_area_2d_mouse_entered():
#	mouse_into_us = true
#
#
#func _on_area_2d_mouse_exited():
#	mouse_into_us = false


#func _on_area_2d_area_entered(area):
#	if area.name == "FurnitureArea":
#		in_interior = true
#		furniture_position = area.global_position
#
#
#func _on_area_2d_area_exited(area):
#	print(23)
#	in_interior = false
	
