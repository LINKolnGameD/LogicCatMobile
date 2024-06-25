extends Control

#Preferences are made by changing frames of animation, 
#so 0 = lonly, 1 = sociable, 2 = hieghtlover, 3 = lowlover, 4 = warmlover, 5 = nothing

@onready var FirstPreference = $CatPreference
@onready var SecondPreference = $CatPreference2
@onready var ThirdPreference = $CatPreference3
@onready var Cat = $Cat

#moving vars
var is_dragging: bool
var into_cat: bool
var can_be_picked: bool = true
var in_interior: bool = false
var interior_position
var out_of_card_area: bool = false

#satisfaction mechanics
var Type = "Cat"
var satisfaction : int

func _ready():
	into_cat = false

	is_dragging = false

func _process(delta):
	print(in_interior)
	#movement cat control
	if Input.is_action_just_released("click"):
		# if it only cat that picked and we click on cat we can move it else (if we already pick it) we just let him go
		if is_dragging:
			is_dragging = false
			out_of_card()
		#bag-report: if it is 2 on one place and you click on it, it made first cat normal, but you cant drop second and can do nothing
	elif Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
		if can_be_picked:
			if into_cat == true:
				is_dragging = true
	else:
		is_dragging = false
	if is_dragging:
			Cat.global_position = get_viewport().get_mouse_position()
		
	Cat.move_and_slide()
		

func out_of_card():
	if out_of_card_area:
		print("out of card area")
		Cat.reparent($"../../../..", true)
		if Cat.get_parent().name == "MainScene":
			if in_interior == true:
				print("in interior")
				Cat.velocity = Vector2(Cat.global_position.direction_to(interior_position)) * 100
#			else:
#				print("out_of_interior")
#				Cat.reparent($".", true)
#				Cat.velocity = Vector2(Cat.global_position.direction_to($".".global_position)) * 100
			
#	else:
#		Cat.reparent($".", true)
#		elif in_interior == false:
#			print("back to card")
##			if Cat.get_parent().name == "MainScene":
#			Cat.reparent($".", true)
#			Cat.velocity = Vector2(Cat.global_position.direction_to($".".global_position)) * 100
#			print(Vector2(Cat.global_position.direction_to($".".global_position)))
#		else:
#			Cat.velocity = Vector2.ZERO
#	elif Cat.get_parent().name == "Card":
#			print("we on card")
#			print($".".global_position)
#			Cat.reparent($".", true)
#			Cat.velocity = Vector2(global_position.direction_to($".".global_position))
#			print(Cat.velocity)
#try move instead position

func _on_area_2d_body_entered(body):
	if body.get_class() == "CharacterBody2D":
		pass


func _on_area_2d_mouse_entered():
	into_cat = true


func _on_area_2d_mouse_exited():
	into_cat = false


func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	in_interior = true
	interior_position = area.global_position


func _on_area_2d_area_shape_exited(area_rid, area, area_shape_index, local_shape_index):
	in_interior = false


func _on_area_2d_area_exited(area):
	out_of_card_area = true
