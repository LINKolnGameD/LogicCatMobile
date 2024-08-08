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

var fcat_places = []
var scat_places = []
var tcat_places = []
var lcat_places = []

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
	elif level == 4:
		card_amount = 2
	elif level == 5:
		card_amount = 1
	elif level == 6:
		card_amount = 1
	elif level == 7:
		card_amount = 1
	elif level == 8:
		card_amount = 1
	elif level == 9:
		card_amount = 2
	elif level == 10:
		card_amount = 2
	elif level == 11:
		card_amount = 3
	elif level == 12:
		card_amount = 2
	elif level == 13:
		card_amount = 2
	elif level == 14:
		card_amount = 2
	elif level == 15:
		card_amount = 2
	elif level == 16:
		card_amount = 2
	elif level == 17:
		card_amount = 1
	elif level == 18:
		card_amount = 2
	elif level == 19:
		card_amount = 1
	elif level == 20:
		card_amount = 2
	elif level == 21:
		card_amount = 1
	elif level == 22:
		card_amount = 1
	elif level == 23:
		card_amount = 1
	elif level == 24:
		card_amount = 1
	elif level == 25:
		card_amount = 2
	elif level == 26:
		card_amount = 3
	elif level == 27:
		card_amount = 3
	elif level == 28:
		card_amount = 2
	elif level == 29:
		card_amount = 2
	elif level == 30:
		card_amount = 2
#	elif level == 31:
#		card_amount = 3
#	elif level == 32:
#		card_amount = 3
#	elif level == 33:
#		card_amount = 2
#	elif level == 34:
#		card_amount = 3
#	elif level == 35:
#		card_amount = 3
#	elif level == 36:
#		card_amount = 2
#	elif level == 21:
#		card_amount = 1
	
		
		
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
	print("first: ", fcat_places)
	print("second: ", scat_places)
	print("third: ", tcat_places)
	print("fought: ", lcat_places)
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
		if level == 4:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 5:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 6:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 7:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 8:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 9:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 10:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 11:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		if level == 12:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 13:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 14:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 15:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 16:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 17:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 18:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 19:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 20:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 21:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 22:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 23:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 24:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		if level == 25:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 26:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(1)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		if level == 27:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(1)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		if level == 28:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 29:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		if level == 30:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			
			
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
		elif level == 4:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 5, true)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 11, false)
		elif level == 5:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(9)
		elif level == 6:
			Level.spawn("Puff", 9, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Table", 7, false)
			Level.spawn_plug(9)
		elif level == 7:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 13, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(6)
		elif level == 8:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 8, false)
			Level.spawn("Puff", 14, false)
			Level.spawn_plug(8)
			Level.spawn_plug(14)
		elif level == 9:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Puff", 5, false)
			Level.spawn("Puff", 8, true)
			Level.spawn("Puff", 10, false)
		elif level == 10:
			Level.spawn("Puff", 4, false)
			Level.spawn("Sofa2", 6, false)
			Level.spawn("Sofa", 7, false)
			Level.spawn("Puff", 13, false)
		elif level == 11:
			Level.spawn("Sofa2", 1, false)
			Level.spawn("Sofa", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 9, true)
		elif level == 12:
			Level.spawn("ArmChair", 1, false)
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ArmChair", 9, false)
			Level.spawn("ArmChair", 11, false)
			Level.spawn_plug(11)
		elif level == 13:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 11, false)
		elif level == 14:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("ArmChair", 5, true)
		elif level == 15:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 6, false)
			Level.spawn("Puff", 11, false)
		elif level == 16:
			Level.spawn("Puff", 1, false)
			Level.spawn("Sofa2", 9, false)
			Level.spawn("Sofa", 10, false)
			Level.spawn("Puff", 7, false)
		elif level == 17:
			Level.spawn("Stand", 2, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("Puff", 16, false)
			Level.spawn_plug(16)
		elif level == 18:
			Level.spawn("Puff", 4, false)
			Level.spawn("Puff", 5, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Table", 7, false)
		elif level == 19:
			Level.spawn("Stand", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 14, true)
			Level.spawn_plug(9)
		elif level == 20:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Stand", 13, true)
		elif level == 21:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn_plug(3)
		elif level == 22:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Puff", 4, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn_plug(6)
		elif level == 23:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Table2", 9, true)
			Level.spawn("Table", 5, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(6)
			Level.spawn_plug(9)
		elif level == 24:
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("Table", 6, true)
			Level.spawn("Table2", 10, true)
			Level.spawn_plug(6)
		elif level == 25:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 8, false)
			Level.spawn_plug(3)
		elif level == 26:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Stand", 3, false)
			Level.spawn("Puff", 4, false)
			Level.spawn("Stand", 5, false)
			Level.spawn("Puff", 10, false)
			Level.spawn("Stand", 12, false)
			Level.spawn("ArmChair", 13, true)
			Level.spawn("Puff", 15, false)
		elif level == 27:
			Level.spawn("Puff", 2, false)
			Level.spawn("Stand", 5, false)
			Level.spawn("Stand", 9, false)
			Level.spawn("Sofa2", 11, false)
			Level.spawn("Sofa", 12, false)
			Level.spawn("Puff", 14, false)
		elif level == 28:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 8, false)
			Level.spawn("Stand", 10, false)
			Level.spawn("ArmChair", 12, true)
			Level.spawn("Puff", 13, false)
			Level.spawn("Stand", 16, false)
			Level.spawn_plug(2)
			Level.spawn_plug(12)
			Level.spawn_plug(13)
		elif level == 29:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Stand", 6, false)
			Level.spawn("Puff", 12, false)
		elif level == 30:
			Level.spawn("Stand", 5, false)
			Level.spawn("Puff", 7, false)
			Level.spawn("Puff", 9, false)
			Level.spawn("Table2", 10, false)
			Level.spawn("Table", 11, false)
			Level.spawn("Puff", 14, false)
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
	
		
		
