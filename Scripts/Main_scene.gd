extends Node2D

var level: int

@onready var FirstCard = $CanvasLayer/HBoxContainer/Card
@onready var SecondCard = $CanvasLayer/HBoxContainer/Card2
@onready var ThirdCard = $CanvasLayer/HBoxContainer/Card3
@onready var FourthCard = $CanvasLayer/HBoxContainer/Card4
@onready var LevelInterior = $Protolevel
@onready var Camera = $Camera2D
@onready var BackGround = $Background
@onready var Level = $Protolevel
@onready var UI = $CanvasLayer/GUI
@onready var CardArray = []
@onready var CatsSatisfaction = []
#flag
var preferences_set : bool = false
var furniture_set: bool = false
var cat_numeration_set: bool = false

var card_amount : int
var first_cat_preferences_info : Array
var second_cat_preferences_info : Array
var third_cat_preferences_info : Array
var fourth_cat_preferences_info : Array

func _ready():
	level = EventBus.global_level_info

#make intro screen
#so 0 = lonly, 1 = sociable, 2 = hieghtlover, 3 = lowlover, 4 = warmlover, 5 = nothing

	#level card amount managment
	if level == 1:
		card_amount = 1
	elif level == 2:
		card_amount = 1
	elif level == 3:
		card_amount = 1
	
		
		
	#card on level control
	if card_amount == 1:
		SecondCard.queue_free()
		ThirdCard.queue_free()
		FourthCard.queue_free()
		CardArray.append(FirstCard)
	elif card_amount == 2:
		ThirdCard.queue_free()
		FourthCard.queue_free()
		CardArray.append(FirstCard)
		CardArray.append(SecondCard)
	elif card_amount == 3:
		FourthCard.queue_free()
		CardArray.append(FirstCard)
		CardArray.append(SecondCard)
		CardArray.append(ThirdCard)
	else:
		CardArray.append(FirstCard)
		CardArray.append(SecondCard)
		CardArray.append(ThirdCard)
		CardArray.append(FourthCard)

func _process(_delta):
	print(level)
	if cat_numeration_set == false:
		if card_amount == 1:
			$CanvasLayer/HBoxContainer/Card.Cat.cat_numeration = 1
		elif card_amount == 2:
			$CanvasLayer/HBoxContainer/Card.Cat.cat_numeration = 1
			$CanvasLayer/HBoxContainer/Card2.Cat.cat_numeration = 2
		elif card_amount == 3:
			$CanvasLayer/HBoxContainer/Card.Cat.cat_numeration = 1
			$CanvasLayer/HBoxContainer/Card2.Cat.cat_numeration = 2
			$CanvasLayer/HBoxContainer/Card3.Cat.cat_numeration = 3
		elif card_amount == 4:
			$CanvasLayer/HBoxContainer/Card.Cat.cat_numeration = 1
			$CanvasLayer/HBoxContainer/Card2.Cat.cat_numeration = 2
			$CanvasLayer/HBoxContainer/Card3.Cat.cat_numeration = 3
			$CanvasLayer/HBoxContainer/Card3.Cat.cat_numeration = 4
		cat_numeration_set = true
	for i in CardArray:
		pass
	
	
	if $CanvasLayer/HBoxContainer/Card.Cat.target != null:
		$TargetPosition.global_position = $CanvasLayer/HBoxContainer/Card.Cat.target.global_position
	#preferences managment
	if preferences_set == false:
		if level == 1:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 2:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 3:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			
			
			preferences_set = true
	#preferences control
	if card_amount >= 1:
		FirstCard.FirstPreference.frame = first_cat_preferences_info[0]
		FirstCard.SecondPreference.frame = first_cat_preferences_info[1]
		FirstCard.ThirdPreference.frame = first_cat_preferences_info[2]
	if card_amount >= 2:
		SecondCard.FirstPreference.frame = second_cat_preferences_info[0]
		SecondCard.SecondPreference.frame = second_cat_preferences_info[1]
		SecondCard.ThirdPreference.frame = second_cat_preferences_info[2]
	if card_amount >= 3:
		ThirdCard.FirstPreference.frame = third_cat_preferences_info[0]
		ThirdCard.SecondPreference.frame = third_cat_preferences_info[1]
		ThirdCard.ThirdPreference.frame = third_cat_preferences_info[2]
	if card_amount == 4:
		FourthCard.FirstPreference.frame = fourth_cat_preferences_info[0]
		FourthCard.SecondPreference.frame = fourth_cat_preferences_info[1]
		FourthCard.ThirdPreference.frame = fourth_cat_preferences_info[2]
			
	if furniture_set == false:
		#(0"Sofa", 1"CoffeTable", 2"Box", 3"ArmChair", 4"ChairEars", 5"Bed", 6"BedEars", 7"Puff", 8"PuffEars", 9"Table", 10"Stand", 11"Shelf")
		#(furniture_name, furniture_position, flip_info)
		if level == 1:
			Level.spawn("ArmChair", 2, false)
		elif level == 2:
			Level.spawn("Puff", 3, false)
			Level.spawn("Puff", 9, false)
		elif level == 3:
			Level.spawn("ArmChair", 4, false)
			Level.spawn("ArmChair", 5, true)
			Level.spawn("Puff", 15, false)
		furniture_set = true
			
#
#	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
#		if UI.in_mouse_area:
#			print("in mouse area")
#			Camera.position.x = get_viewport().get_mouse_position().x 
	
	#camera limits
	if Camera.zoom > Vector2(1.3, 1.3):
		Camera.set_zoom(Vector2(1.3,1.3))
	if Camera.zoom < Vector2(0.7, 0.7):
		Camera.set_zoom(Vector2(0.7,0.7))
	if Camera.position.x < 0:
		Camera.position.x = 0
	if Camera.position.x > 1200:
		Camera.position.x = 1200
	
#	fix this shit
	#control that we can take only one card at time
	if card_amount == 2:
		if FirstCard.Cat.current_state == 2:
			SecondCard.Cat.can_be_picked = false
		elif SecondCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
		else:
			FirstCard.Cat.can_be_picked = true
			SecondCard.Cat.can_be_picked = true
	elif card_amount == 3:
		if FirstCard.Cat.current_state == 2:
			SecondCard.Cat.can_be_picked = false
			ThirdCard.Cat.can_be_picked = false
		elif SecondCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
			ThirdCard.Cat.can_be_picked = false 
		elif ThirdCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
			SecondCard.Cat.can_be_picked = false
		else:
			FirstCard.Cat.can_be_picked = true
			SecondCard.Cat.can_be_picked = true
			ThirdCard.Cat.can_be_picked = true
	elif card_amount == 4:
		if FirstCard.Cat.current_state == 2:
			SecondCard.Cat.can_be_picked = false
			ThirdCard.Cat.can_be_picked = false
			FourthCard.Cat.can_be_picked = false
		elif SecondCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
			ThirdCard.Cat.can_be_picked = false 
			FourthCard.Cat.can_be_picked = false
		elif ThirdCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
			SecondCard.Cat.can_be_picked = false
			FourthCard.Cat.can_be_picked = false
		elif FourthCard.Cat.current_state == 2:
			FirstCard.Cat.can_be_picked = false
			SecondCard.Cat.can_be_picked = false
			ThirdCard.Cat.can_be_picked = false
		else:
			FirstCard.Cat.can_be_picked = true
			SecondCard.Cat.can_be_picked = true
			ThirdCard.Cat.can_be_picked = true
			FourthCard.Cat.can_be_picked = true

#func _input(event):
#	if event is InputEventMouseButton:
#		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
#			Camera.zoom = Camera.get_zoom() * (Vector2(0.97, 0.97))
#		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
#			Camera.zoom = Camera.get_zoom() * (Vector2(1.03,1.03))
	
		
		
