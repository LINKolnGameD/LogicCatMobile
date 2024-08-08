class_name Cat extends CharacterBody2D

@export var speed:int = 300

@onready var collision = $CatAnSprite/AreaCat/CollisionShape2D

var card: Control
var map: Node2D
@onready var in_which_area = []
var calculate_closest_area = []
var predictable_target
var satisfaction
var main_scene_way

#moving state machine
const STAND = 1
const MOVE = 2
const TAKEN = 3

enum STATE {STAND, MOVE, TAKEN}
var current_state : STATE

#preferences state machine
const HATE = 1
const CARELESS = 2
const LOVE = 3

enum STATESATIS {NO, CARELESS, YES}

var prefer_lonlyness: STATESATIS
var prefer_hight: STATESATIS
var prefer_warmth: STATESATIS

var our_preferences = []
var parent_preferences = []

var can_be_picked: bool = true
var _mouse_enter: bool = false
var cat_numeration: int

var target: Node

func _ready():
	var AreaColl = get_node("CatAnSprite/AreaCat")
	AreaColl.area_entered.connect(_area_entered)
	AreaColl.area_exited.connect(_area_exited)
	AreaColl.mouse_entered.connect(_mouse_enterend)
	AreaColl.mouse_exited.connect(_mouse_exited)
	


func _process(delta):
	print(cat_numeration)
	if get_parent().get_parent().name == "HBoxContainer":
		main_scene_way = card.MainScene
	elif get_parent().name == "FurnitureArea":
		main_scene_way = get_parent().get_parent().get_parent().MainScene
	if satisfaction != null:

		if cat_numeration == 1:
			main_scene_way.CatsSatisfaction.pop_at(0)
			main_scene_way.CatsSatisfaction.insert(0, satisfaction)
		elif cat_numeration == 2:
			main_scene_way.CatsSatisfaction.pop_at(1)
			main_scene_way.CatsSatisfaction.insert(1, satisfaction)
		elif cat_numeration == 3:
			main_scene_way.CatsSatisfaction.pop_at(2)
			main_scene_way.CatsSatisfaction.insert(2, satisfaction)
		elif cat_numeration == 4:
			main_scene_way.CatsSatisfaction.pop_at(3)
			main_scene_way.CatsSatisfaction.insert(3, satisfaction)
	
	#analytics of satisfaction
	if len(parent_preferences) != 0:
		if parent_preferences[0] != our_preferences[0] and our_preferences[0] != 2:
			satisfaction = 0
		elif  parent_preferences[1] != our_preferences[1] and our_preferences[1] != 2:
			satisfaction = 0
		elif parent_preferences[2] != our_preferences[2] and our_preferences[2] != 2:
			satisfaction = 0
		else:
			if parent_preferences[3] == 3:
				satisfaction = 100
			elif our_preferences[0] == 2 and our_preferences[1] == 2 and our_preferences[2] == 2 and parent_preferences[3] != 3:
				if main_scene_way.Level.current_furniture.any(for_blank_cats):
					satisfaction = 50
				else:
					satisfaction = 100
			else:
				if our_preferences[0] == 2:
					if main_scene_way.Level.current_furniture.any(no_cat_good_and_comfy):
						satisfaction = 50
#					elif main_scene_way.Level.current_furniture.any(free_okay_place):
#						satisfaction = 50
					else:
						satisfaction = 100
				else:
#					for i in main_scene_way.Level.current_cells:
#						if main_scene_way.Level.current_cells.has(i+1) and i != 4 and i != 8 and i != 12 or main_scene_way.Level.current_cells.has(i-1) and i != 5 and i != 9 and i != 13 or main_scene_way.Level.current_cells.has(i+4) or main_scene_way.Level.current_cells.has(i-4) or main_scene_way.Level.current_cells.has(i-5) and i != 9 and i != 13 or main_scene_way.Level.current_cells.has(i+5) and i != 4 and i != 8 or main_scene_way.Level.current_cells.has(i-3) and i != 4 and i != 8 and i != 12 and i != 16 or main_scene_way.Level.current_cells.has(i+1) and i != 1 and i != 5 and i != 9 and i != 13:
#							if main_scene_way.Level.current_cells[main_scene_way.Level.current_cells.find(i+1)] != -1 and len(main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i+1)].cat_chidrens_array) != 0 and main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i+1)].soft or main_scene_way.Level.current_cells[main_scene_way.Level.current_cells.find(i-1)] != -1 and len(main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i-1)].cat_chidrens_array) != 0 and main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i-1)].soft or main_scene_way.Level.current_cells[main_scene_way.Level.current_cells.find(i+4)] != -1 and len(main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i+4)].cat_chidrens_array) != 0 and main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i+4)].soft or main_scene_way.Level.current_cells[main_scene_way.Level.current_cells.find(i-4)] != -1 and len(main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i-4)].cat_chidrens_array) != 0 and main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(i-4)].soft:
#								satisfaction = 100
#								if len(main_scene_way.Level.current_furniture.filter(any_cells_left)) > 2:
#									satisfaction = 50
#								else:
#									if main_scene_way.Level.current_furniture.any(no_cat_good_and_comfy):
#										satisfaction = 50
#									else:
#										satisfaction = 100
#							else:
#								satisfaction = 50
#						else:
#							satisfaction = 100
					if our_preferences[0] == 1:
						if main_scene_way.Level.current_furniture.any(for_social_cat):
							satisfaction = 50
						else:
							if len(main_scene_way.Level.current_furniture.filter(free_place)) > 2:
								satisfaction = 50
							else:
								satisfaction = 100
					else:
						if main_scene_way.Level.current_furniture.any(for_lonely_cat):
							satisfaction = 50
						else:
							satisfaction = 100

	if current_state == 2 or get_parent() is Card:
		satisfaction = 0


	#sending info to main


	#animation controll
	if current_state == 2:
		$CatAnSprite.animation = "RedStrpTaken"
	else:
		$CatAnSprite.animation = "RedStrpTail"
	
	if len(in_which_area) >= 2:
		for i in in_which_area:
			calculate_closest_area.pop_at(in_which_area.find(i))
			calculate_closest_area.insert(in_which_area.find(i),global_position.distance_to(i.global_position))
		predictable_target = in_which_area[calculate_closest_area.find(calculate_closest_area.min())]
	elif len(in_which_area) == 1:
		predictable_target = in_which_area[0]
#	print(calculate_closest_area)
	for i in in_which_area:
		global_position.distance_to(i.global_position)
		
	if target == null:
		target = card
		if predictable_target != null:
			target = predictable_target
	elif target != card:
		target = predictable_target
	
		
	_update_state(delta)

		
	
	
	if global_position.distance_to(target.global_position) < 10 and current_state == STATE.MOVE: 
		_set_state(STATE.STAND)
	
	move_and_slide()
	
	if not _mouse_enter: return
	
	if Input.is_action_pressed("click"):
		if can_be_picked:
			_set_state(STATE.TAKEN)
	elif Input.is_action_just_released("click"):
		_set_state(STATE.MOVE)
		
		
func for_blank_cats(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if node.cat_chidrens_array[0].our_preferences[0] == 2 and node.cat_chidrens_array[0].our_preferences[1] == 2 and node.cat_chidrens_array[0].our_preferences[2] == 2:
				return false
			else:
				return true
		else:
			return true
	else:
		return false
		
		
func free_place(node):
	if len(node.cat_chidrens_array) == 0:
		if node.soft:
			if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
				if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2:
					if main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 == 13 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 12 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 4) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 4).cat_chidrens_array) == 0 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 4) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 4).cat_chidrens_array) == 0 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5 != 13 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5 != 8 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 16 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 13:
						return true
					else:
						return false
				else:
					return false
			else:
				return false
		else:
			return false
		
func for_lonely_cat(node):
	print(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+4)
	if len(node.cat_chidrens_array) == 0:
		if node.soft:
			if node.lonely == false:
				if node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+1)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 12:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-1)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 13:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-4)]:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+4)]:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-5)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent())] != 13:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+5)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-3)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 16:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				elif node == main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+3)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 13:
					if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
						if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
							print(node.lonely)
							return true
						else:
							return false
					else:
						return false
				else:
					return false
			else:
				if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
					if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
						return true
					else:
						return false
				else:
					return false
		else:
			return false
	else:
		return false
		
func for_social_cat(node):
	if len(node.cat_chidrens_array) == 0:
		if node.soft:
			if node.lonely == false and node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+1)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 12 or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-1)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 13 or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-4)] or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+4)] or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-5)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent())] != 13 or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+5)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8 or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]-3)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 16 or node != main_scene_way.Level.current_furniture[main_scene_way.Level.current_furniture.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]+3)] and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())] != 13:
				if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
					if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2 or node.post_warmth and our_preferences[2] == 3:
						return true
					else:
						return false
				else:
					return false
			else:
				return false
		else:
			return false
	else:
		return false
		
func free_okay_place(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 16 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13:
				if node.lonely == true:
					if our_preferences[1] == 3:
						return true
					else:
						return false
				else:
					if our_preferences[1] == 3:
						return false
					else:
						return true
						
func any_cells_left(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 16 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13:
				return node
		
		
func no_cat_good_and_comfy(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			return false
		else:
			if our_preferences[1] == 3 and node.high or our_preferences[1] == 1 and node.high == false or our_preferences[2] == 3 and node.warmth or our_preferences[2] == 1 and node.warmth == false:
				return true
			else:
				return false
	else:
		return false
	

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			reparent(target)
			
		STATE.MOVE: # Enter WALK state logic
			reparent(card)
			
		STATE.TAKEN: # Enter JUMP state logic
			
			reparent(card)

@warning_ignore("unused_parameter")
func _update_state(delta: float) -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			position =  Vector2(0, target.position.y)
			
		STATE.MOVE: # Enter WALK state logic
			global_position = target.global_position
			
		STATE.TAKEN: # Enter JUMP state logic
			global_position = get_viewport().get_mouse_position()
			

func _exit_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			pass
			
		STATE.MOVE: # Enter WALK state logic
			pass
			
		STATE.TAKEN: # Enter JUMP state logic
			pass

func _area_entered(node):
	if node.name != "FurnitureArea" or current_state != STATE.TAKEN: return
	in_which_area.append(node)
	target = predictable_target
#	hit_with_object()

func _area_exited(node):
#	hit_with_object()
	in_which_area.erase(node)
	calculate_closest_area.pop_at(in_which_area.find(node))
	if target == node:
		target = card

func _mouse_exited():
	_mouse_enter = false

func _mouse_enterend():
	_mouse_enter = true

#func hit_with_object():
#	calculate_closest_area.clear()

		
	
