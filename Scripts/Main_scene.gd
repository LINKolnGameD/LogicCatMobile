extends Node2D

var blue_background_color = "c9d4e3"


@export var level: int

@onready var FirstCard = $CanvasLayer/MarginContainer/HBoxContainer/Card
@onready var SecondCard = $CanvasLayer/MarginContainer/HBoxContainer/Card2
@onready var ThirdCard = $CanvasLayer/MarginContainer/HBoxContainer/Card3
@onready var FourthCard = $CanvasLayer/MarginContainer/HBoxContainer/Card4
@onready var LevelInterior = $Protolevel
@onready var Camera = $Protolevel/Camera2D
@onready var BackGround = $Background
@onready var Level = $Protolevel

#flag
var preferences_set : bool = false
var furniture_set: bool = false

var card_amount : int
var first_cat_preferences_info : Array
var second_cat_preferences_info : Array
var third_cat_preferences_info : Array
var fourth_cat_preferences_info : Array

func _ready():
	RenderingServer.set_default_clear_color(Color(blue_background_color))
#fix cat stacking
#make intro screen
#random floor 
#fix card move problem

#23.06 tasks: send anya docs, get info about jam, start animation
#so 0 = lonly, 1 = sociable, 2 = hieghtlover, 3 = lowlover, 4 = warmlover, 5 = nothing

	#level card amount managment
	if level == 1:
		card_amount = 1
		
		
	#card on level control
	if card_amount == 1:
		SecondCard.queue_free()
		ThirdCard.queue_free()
		FourthCard.queue_free()
	elif card_amount == 2:
		ThirdCard.queue_free()
		FourthCard.queue_free()
	elif card_amount == 3:
		FourthCard.queue_free()

func _process(delta):
	
	#preferences managment
	if preferences_set == false:
		if level == 1:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			preferences_set = true
	#preferences control
	FirstCard.FirstPreference.frame = first_cat_preferences_info[0]
	FirstCard.SecondPreference.frame = first_cat_preferences_info[1]
	FirstCard.ThirdPreference.frame = first_cat_preferences_info[2]
			
	if furniture_set == false:
		#(0"Sofa", 1"CoffeTable", 2"Box", 3"ArmChair", 4"ChairEars", 5"Bed", 6"BedEars", 7"Puff", 8"PuffEars", 9"Table", 10"Stand", 11"Shelf")
		#(furniture_name, furniture_position, flip_info)
		if level == 1:
			Level.spawn("Stand", "Cell2", false)
		furniture_set = true
			
			
			
	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
		Camera.position.x = get_viewport().get_mouse_position().x 
	
	#camera limits
	if Camera.zoom > Vector2(1.3, 1.3):
		Camera.set_zoom(Vector2(1.3,1.3))
	if Camera.zoom < Vector2(0.7, 0.7):
		Camera.set_zoom(Vector2(0.7,0.7))
	if Camera.position.x < 0:
		Camera.position.x = 0
	if Camera.position.x > 1200:
		Camera.position.x = 1200
	
	#control that we can take only one card at time
	if card_amount == 2:
		if FirstCard.is_dragging == true:
			SecondCard.can_be_picked = false
		elif SecondCard.is_dragging == true:
			FirstCard.can_be_picked = false
		else:
			FirstCard.can_be_picked = true
			SecondCard.can_be_picked = true
	if card_amount == 3:
		if FirstCard.is_dragging == true:
			SecondCard.can_be_picked = false
			ThirdCard.can_be_picked = false
		elif SecondCard.is_dragging == true:
			FirstCard.can_be_picked = false
			ThirdCard.can_be_picked = false 
		elif ThirdCard.is_dragging == true:
			FirstCard.can_be_picked = false
			SecondCard.can_be_picked = false
		else:
			FirstCard.can_be_picked = true
			SecondCard.can_be_picked = true
			ThirdCard.can_be_picked = true
	if card_amount == 4:
		if FirstCard.is_dragging == true:
			SecondCard.can_be_picked = false
			ThirdCard.can_be_picked = false
			FourthCard.can_be_picked = false
		elif SecondCard.is_dragging == true:
			FirstCard.can_be_picked = false
			ThirdCard.can_be_picked = false 
			FourthCard.can_be_picked = false
		elif ThirdCard.is_dragging == true:
			FirstCard.can_be_picked = false
			SecondCard.can_be_picked = false
			FourthCard.can_be_picked = false
		elif FourthCard.is_dragging == true:
			FirstCard.can_be_picked = false
			SecondCard.can_be_picked = false
			ThirdCard.can_be_picked = false
		else:
			FirstCard.can_be_picked = true
			SecondCard.can_be_picked = true
			ThirdCard.can_be_picked = true
			FourthCard.can_be_picked = true
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			Camera.zoom = Camera.get_zoom() * (Vector2(0.97, 0.97))
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			Camera.zoom = Camera.get_zoom() * (Vector2(1.03,1.03))
	
		
		
