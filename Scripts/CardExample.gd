extends Control

@onready var Cat = $Cat
#@onready var OurArea = $Cat/CatAnSprite/Area2D

@onready var FirstPreference = $CatPreference
@onready var SecondPreference = $CatPreference2
@onready var ThirdPreference = $CatPreference3

#var mouse_into_us: bool = false
#var is_dragging: bool = false
#var can_be_picked: bool = true
#var in_interior: bool = false
#var furniture_position


func _ready():
	Cat.card = self

func _process(delta):
	pass
	
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
	
