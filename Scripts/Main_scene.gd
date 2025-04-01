extends Node2D

var level: int

@onready var FirstCard = $CanvasLayer/HBoxContainer/Card
@onready var SecondCard = $CanvasLayer/HBoxContainer/Card2
@onready var ThirdCard = $CanvasLayer/HBoxContainer/Card3
@onready var FourthCard = $CanvasLayer/HBoxContainer/Card4
@onready var LevelInterior = $Protolevel
@onready var BackGround = $Background
@onready var Level = $Protolevel
@onready var UI = $CanvasLayer/GUI
@onready var CardArray = []
@onready var CatsSatisfaction = []
@onready var Sound = []


#flag
var preferences_set : bool = false
var furniture_set: bool = false
var cat_numeration_set: bool = false

var card_amount : int
@onready var first_cat_preferences_info : Array
@onready var second_cat_preferences_info : Array
@onready var third_cat_preferences_info : Array
@onready var fourth_cat_preferences_info : Array

var fcat_places = []
var scat_places = []
var tcat_places = []
var lcat_places = []

var simple = [5, 5, 5]
var up = [2, 5, 5]
var lonely = [0, 5, 5]
var social = [1, 5, 5]
var down = [3, 5, 5]
var down_lonely = [0, 3, 5]
var up_lonely = [0, 2, 5]
var down_social = [1, 3, 5]
var up_social = [1, 2, 5]
var warmer = [4, 5, 5]
var warmer_lon = [0, 4, 5]
var warmer_soc = [1, 4, 5]
var warmer_up = [2, 4, 5]
var warmer_down = [3, 4, 5]
var hidden_lonely = [6, 4, 5]


func _ready():
	get_tree().paused = false
	level = get_parent().global_level_info


#make intro screen
#so 0 = lonly, 1 = sociable, 2 = hieghtlover, 3 = lowlover, 4 = warmlover, 5 = nothing

	#level card amount managment
	if level == 1:
		card_amount = 1
	elif level == 2:
		card_amount = 2
	elif level == 3:
		card_amount = 1
	elif level == 4:
		card_amount = 1
	elif level == 5:
		card_amount = 1
	elif level == 6:
		card_amount = 1
	elif level == 7:
		card_amount = 2
	elif level == 8:
		card_amount = 2
	elif level == 9:
		card_amount = 3
	elif level == 10:
		card_amount = 1
	elif level == 11:
		card_amount = 2
	elif level == 12:
		card_amount = 1
	elif level == 13:
		card_amount = 1
	elif level == 14:
		card_amount = 1
	elif level == 15:
		card_amount = 1
	elif level == 16:
		card_amount = 1
	elif level == 17:
		card_amount = 2
	elif level == 18:
		card_amount = 3
	elif level == 19:
		card_amount = 2
	elif level == 20:
		card_amount = 2
	elif level == 21:
		card_amount = 3
	elif level == 22:
		card_amount = 2
	elif level == 23:
		card_amount = 3
	elif level == 24:
		card_amount = 2
	elif level == 25:
		card_amount = 3
	elif level == 26:
		card_amount = 3
	elif level == 27:
		card_amount = 1
	elif level == 28:
		card_amount = 1
	elif level == 29:
		card_amount = 1
	elif level == 30:
		card_amount = 2
	elif level == 31:
		card_amount = 2
	elif level == 32:
		card_amount = 2
	elif level == 33:
		card_amount = 2
	elif level == 34:
		card_amount = 3
	elif level == 35:
		card_amount = 2
	elif level == 36:
		card_amount = 2
	elif level == 37:
		card_amount = 2
	elif level == 38:
		card_amount = 2
	elif level == 39:
		card_amount = 1
	elif level == 40:
		card_amount = 1
	elif level == 41:
		card_amount = 1
	elif level == 42:
		card_amount = 2
	elif level == 43:
		card_amount = 2
	elif level == 44:
		card_amount = 2
	elif level == 45:
		card_amount = 2
	elif level == 46:
		card_amount = 2
	elif level == 47:
		card_amount = 3
	elif level == 48:
		card_amount = 3
	elif level == 49:
		card_amount = 4
	elif level == 50:
		card_amount = 3
	elif level == 51:
		card_amount = 3
	elif level == 52:
		card_amount = 3
	elif level == 53:
		card_amount = 3
	elif level == 54:
		card_amount = 3
	elif level == 55:
		card_amount = 4
	elif level == 56:
		card_amount = 4
	elif level == 57:
		card_amount = 1
	elif level == 58:
		card_amount = 1
	elif level == 59:
		card_amount = 1
	elif level == 60:
		card_amount = 3
	elif level == 61:
		card_amount = 2
	elif level == 62:
		card_amount = 2
	elif level == 63:
		card_amount = 2
	elif level == 64:
		card_amount = 2
	elif level == 65:
		card_amount = 2
	elif level == 66:
		card_amount = 2
	elif level == 67:
		card_amount = 3
	elif level == 68:
		card_amount = 3
	elif level == 69:
		card_amount = 3
	elif level == 70:
		card_amount = 2
	elif level == 71:
		card_amount = 2
	elif level == 72:
		card_amount = 3
	elif level == 73:
		card_amount = 2
	elif level == 74:
		card_amount = 3
	elif level == 75:
		card_amount = 3
	elif level == 76:
		card_amount = 2
	elif level == 77:
		card_amount = 3
	elif level == 78:
		card_amount = 3
	elif level == 79:
		card_amount = 3
	elif level == 80:
		card_amount = 4
	elif level == 81:
		card_amount = 2
	elif level == 82:
		card_amount = 3
	elif level == 83:
		card_amount = 2
	elif level == 84:
		card_amount = 3
	elif level == 85:
		card_amount = 3
	elif level == 86:
		card_amount = 3
	elif level == 87:
		card_amount = 4
	elif level == 88:
		card_amount = 4
	elif level == 89:
		card_amount = 2
	elif level == 90:
		card_amount = 4
	elif level == 91:
		card_amount = 4
	elif level == 92:
		card_amount = 4
	elif level == 93:
		card_amount = 1
	
	EventBus.if_need_education.emit(level)
	
	
		
		
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

	if preferences_set == false:
		if level == 1:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 2:
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 3:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 4:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 5:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 6:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 7:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 8:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 9:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		elif level == 10:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 11:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(0)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 12:
			first_cat_preferences_info.append(0)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 13:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 14:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 15:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 16:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
		elif level == 17:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 18:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(1)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		elif level == 19:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
		elif level == 20:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			# вот тут я остановился
		elif level == 21:
			first_cat_preferences_info.append(1)
			first_cat_preferences_info.append(5)
			first_cat_preferences_info.append(5)
			second_cat_preferences_info.append(1)
			second_cat_preferences_info.append(5)
			second_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
			third_cat_preferences_info.append(5)
		elif level == 22:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(social)
		elif level == 23:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(lonely)
			third_cat_preferences_info.append_array(lonely)
		elif level == 24:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(lonely)
		elif level == 25:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(social)
			third_cat_preferences_info.append_array(simple)
		elif level == 26:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(social)
			third_cat_preferences_info.append_array(simple)
		elif level == 27:
			first_cat_preferences_info.append_array(up)
		elif level == 28:
			first_cat_preferences_info.append_array(up)
		elif level == 29:
			first_cat_preferences_info.append_array(up)
		elif level == 30:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(up)
		elif level == 31:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(simple)
		elif level == 32:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(simple)
		elif level == 33:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(lonely)
		elif level == 34:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(up)
			third_cat_preferences_info.append_array(lonely)
		elif level == 35:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(lonely)
		elif level == 36:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(social)
		elif level == 37:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(social)
		elif level == 38:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(social)
		elif level == 39:
			first_cat_preferences_info.append_array(down)
		elif level == 40:
			first_cat_preferences_info.append_array(down)
			#вот тут я остановился
		elif level == 41:
			first_cat_preferences_info.append_array(down)
		elif level == 42:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(down)
		elif level == 43:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(lonely)
		elif level == 44:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(lonely)
		elif level == 45:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(social)
		elif level == 46:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(down)
		elif level == 47:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(up)
			third_cat_preferences_info.append_array(down)
		elif level == 48:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(down)
			third_cat_preferences_info.append_array(up)
		elif level == 49:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(down)
			third_cat_preferences_info.append_array(up)
			fourth_cat_preferences_info.append_array(up)
		elif level == 50:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(up)
			third_cat_preferences_info.append_array(down_lonely)
		elif level == 51:
			first_cat_preferences_info.append_array(down_lonely)
			second_cat_preferences_info.append_array(up_lonely)
			third_cat_preferences_info.append_array(up_lonely)
		elif level == 52:
			first_cat_preferences_info.append_array(down_social)
			second_cat_preferences_info.append_array(up_social)
			third_cat_preferences_info.append_array(up_social)
		elif level == 53:
			first_cat_preferences_info.append_array(down_lonely)
			second_cat_preferences_info.append_array(up_lonely)
			third_cat_preferences_info.append_array(up_lonely)
		elif level == 54:
			first_cat_preferences_info.append_array(up_lonely)
			second_cat_preferences_info.append_array(down_lonely)
			third_cat_preferences_info.append_array(down_social)
		elif level == 55:
			first_cat_preferences_info.append_array(up_lonely)
			second_cat_preferences_info.append_array(down_lonely)
			third_cat_preferences_info.append_array(down_social)
			fourth_cat_preferences_info.append_array(simple)
		elif level == 56:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(down_social)
			third_cat_preferences_info.append_array(down_lonely)
			fourth_cat_preferences_info.append_array(lonely)
		elif level == 57:
			first_cat_preferences_info.append_array(warmer)
		elif level == 58:
			first_cat_preferences_info.append_array(warmer)
		elif level == 59:
			first_cat_preferences_info.append_array(warmer)
		elif level == 60:
			first_cat_preferences_info.append_array(warmer)
			second_cat_preferences_info.append_array(warmer)
			third_cat_preferences_info.append_array(warmer)
		elif level == 61:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(warmer)
		elif level == 62:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(warmer)
		elif level == 63:
			first_cat_preferences_info.append_array(lonely)
			second_cat_preferences_info.append_array(warmer)
		elif level == 64:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
		elif level == 65:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
		elif level == 66:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
		elif level == 67:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
			third_cat_preferences_info.append_array(lonely)
		elif level == 68:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
			third_cat_preferences_info.append_array(lonely)
		elif level == 69:
			first_cat_preferences_info.append_array(social)
			second_cat_preferences_info.append_array(warmer)
			third_cat_preferences_info.append_array(lonely)
		elif level == 70:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(warmer)
		elif level == 71:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(warmer)
		elif level == 72:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(up)
			third_cat_preferences_info.append_array(warmer)
		elif level == 73:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(warmer)
		elif level == 74:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(down)
			third_cat_preferences_info.append_array(warmer)
		elif level == 75:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(down)
			third_cat_preferences_info.append_array(warmer)
		elif level == 76:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(warmer)
		elif level == 77:
			first_cat_preferences_info.append_array(down)
			second_cat_preferences_info.append_array(lonely)
			third_cat_preferences_info.append_array(warmer)
		elif level == 78:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(social)
			third_cat_preferences_info.append_array(warmer)
		elif level == 79:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(lonely)
			third_cat_preferences_info.append_array(warmer)
		elif level == 80:
			first_cat_preferences_info.append_array(up)
			second_cat_preferences_info.append_array(lonely)
			third_cat_preferences_info.append_array(warmer)
			fourth_cat_preferences_info.append_array(warmer)
		elif level == 81:
			first_cat_preferences_info.append_array(warmer_lon)
			second_cat_preferences_info.append_array(simple)
		elif level == 82:
			first_cat_preferences_info.append_array(warmer_lon)
			second_cat_preferences_info.append_array(warmer_soc)
			third_cat_preferences_info.append_array(simple)
		elif level == 83:
			first_cat_preferences_info.append_array(warmer_lon)
			second_cat_preferences_info.append_array(simple)
		elif level == 84:
			first_cat_preferences_info.append_array(warmer_lon)
			second_cat_preferences_info.append_array(warmer_lon)
			third_cat_preferences_info.append_array(simple)
		elif level == 85:
			first_cat_preferences_info.append_array(warmer_up)
			second_cat_preferences_info.append_array(warmer_up)
			third_cat_preferences_info.append_array(social)
		elif level == 86:
			first_cat_preferences_info.append_array(warmer_lon)
			second_cat_preferences_info.append_array(warmer_down)
			third_cat_preferences_info.append_array(down_lonely)
		elif level == 87:
			first_cat_preferences_info.append_array(warmer_down)
			second_cat_preferences_info.append_array(up_lonely)
			third_cat_preferences_info.append_array(social)
			fourth_cat_preferences_info.append_array(simple)
		elif level == 88:
			first_cat_preferences_info.append_array(warmer_down)
			second_cat_preferences_info.append_array(warmer_up)
			third_cat_preferences_info.append_array(warmer_lon)
			fourth_cat_preferences_info.append_array(lonely)
		elif level == 89:
			first_cat_preferences_info.append_array([1,3,4])
			second_cat_preferences_info.append_array(simple)
		elif level == 90:
			first_cat_preferences_info.append_array([0, 2, 4])
			second_cat_preferences_info.append_array([0, 2, 4])
			third_cat_preferences_info.append_array(warmer)
			fourth_cat_preferences_info.append_array(simple)
		elif level == 91:
			first_cat_preferences_info.append_array([0, 2, 4])
			second_cat_preferences_info.append_array([0,2,4])
			third_cat_preferences_info.append_array([0,3,4])
			fourth_cat_preferences_info.append_array(simple)
		elif level == 92:
			first_cat_preferences_info.append_array([0, 2, 4])
			second_cat_preferences_info.append_array([0, 3, 4])
			third_cat_preferences_info.append_array([1, 2, 4])
			fourth_cat_preferences_info.append_array([1, 3, 4])
		elif level == 93:
			first_cat_preferences_info.append_array(hidden_lonely)
			
			
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
		preferences_set = true
	#preferences control
	

			
	if furniture_set == false:
		#(0"Sofa", 1"CoffeTable", 2"Box", 3"ArmChair", 4"ChairEars", 5"Bed", 6"BedEars", 7"Puff", 8"PuffEars", 9"Table", 10"Stand", 11"Shelf")
		#(furniture_name, furniture_position, flip_info)
		if level == 1:
			Level.spawn("ArmChair", 2, false)
		elif level == 2:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 5, true)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 11, false)
		elif level == 3:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(9)
		elif level == 4:
			Level.spawn("Puff", 9, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Table", 7, false)
			Level.spawn_plug(9)
		elif level == 5:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 13, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(6)
		elif level == 6:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 8, false)
			Level.spawn("Puff", 14, false)
			Level.spawn_plug(8)
			Level.spawn_plug(14)
		elif level == 7:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Puff", 5, false)
			Level.spawn("Puff", 8, true)
			Level.spawn("Puff", 10, false)
		elif level == 8:
			Level.spawn("Puff", 4, false)
			Level.spawn("Sofa2", 6, false)
			Level.spawn("Sofa", 7, false)
			Level.spawn("Puff", 13, false)
		elif level == 9:
			Level.spawn("Sofa2", 1, false)
			Level.spawn("Sofa", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ArmChair", 9, true)
		elif level == 10:
			Level.spawn("Stand", 2, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("Puff", 16, false)
			Level.spawn_plug(16)
		elif level == 11:
			Level.spawn("Puff", 4, false)
			Level.spawn("Puff", 5, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Table", 7, false)
		elif level == 12:
			Level.spawn("Stand", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 14, true)
			Level.spawn_plug(9)
		elif level == 13:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn_plug(3)
		elif level == 14:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Puff", 4, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn_plug(6)
		elif level == 15:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Table2", 9, true)
			Level.spawn("Table", 5, true)
			Level.spawn("Puff", 6, false)
			Level.spawn_plug(6)
			Level.spawn_plug(9)
		elif level == 16:
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("Table", 6, true)
			Level.spawn("Table2", 10, true)
			Level.spawn_plug(6)
		elif level == 17:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 8, false)
			Level.spawn_plug(3)
		elif level == 18:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Stand", 3, false)
			Level.spawn("Puff", 4, false)
			Level.spawn("Stand", 5, false)
			Level.spawn("Puff", 10, false)
			Level.spawn("Stand", 12, false)
			Level.spawn("ArmChair", 13, true)
			Level.spawn("Puff", 15, false)
		elif level == 19:
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
		elif level == 20:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Stand", 6, false)
			Level.spawn("Puff", 12, false)
		elif level == 21:
			Level.spawn("Stand", 1, false)
			Level.spawn("Stand", 2, false)
			Level.spawn("Puff", 7, false)
		elif level == 22:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 14, false)
			Level.spawn_plug(5)
		elif level == 23:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 8, false)
			Level.spawn_plug(9)
			Level.spawn("ArmChair", 14, true)
		elif level == 24:
			Level.spawn("Stand", 4, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("Sofa2", 13, true)
			Level.spawn("Sofa", 9, true)
			Level.spawn("Puff", 11, false)
			Level.spawn_plug(6)
		elif level == 25:
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Table2", 11, true)
			Level.spawn("Table", 7, true)
		elif level == 26:
			Level.spawn("Puff", 4, false)
			Level.spawn("Stand", 7, true)
			Level.spawn("Puff", 10, false)
			Level.spawn("Stand", 13, true)
		elif level == 27:
			Level.spawn("Shelf", 2, false)
			Level.spawn("Puff", 10, false)
		elif level == 28:
			Level.spawn("ChairEars", 3, false)
			Level.spawn("ArmChair", 5, true)
		elif level == 29:
			Level.spawn("Table2", 6, false)
			Level.spawn("Table", 7, false)
			Level.spawn("Stand", 9, false)
		elif level == 30:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Puff", 11, false)
		elif level == 31:
			Level.spawn("Shelf", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
		elif level == 32:
			Level.spawn("ChairEars", 3, false)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("ChairEars", 10, true)
		elif level == 33:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 5, false)
		elif level == 34:
			Level.spawn("Sofa2", 1, false)
			Level.spawn("Sofa", 2, false)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("ArmChair", 10, true)
			Level.spawn("Stand", 12, false)
		elif level == 35:
			Level.spawn("ArmChair", 4, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn_plug(7)
		elif level == 36:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Stand", 5, true)
			Level.spawn("Puff", 7, false)
			Level.spawn("Shelf", 9, true)
		elif level == 37:
			Level.spawn("CoffeeTable", 1, false)
			Level.spawn("Shelf", 2, false)
			Level.spawn("Stand", 3, false)
			Level.spawn("Puff", 5, false)
		elif level == 38:
			Level.spawn("Stand", 1, true)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn_plug(9)
		elif level == 39:
			Level.spawn("Puff", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
		elif level == 40:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("ChairEars", 9, true)
		elif level == 41:
			Level.spawn("Stand", 3, false)
			Level.spawn("Shelf", 9, true)
		elif level == 42:
			Level.spawn("ChairEars", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("CoffeeTable", 11, false)
			Level.spawn("Stand", 13, true)
		elif level == 43:
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Stand", 14, true)
		elif level == 44:
			Level.spawn("ChairEars", 3, false)
			Level.spawn("Puff", 6, false)
			Level.spawn("ChairEars", 9, true)
			Level.spawn("Stand", 13, true)
		elif level == 45:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Stand", 4, false)
			Level.spawn("Puff", 5, false)
		elif level == 46:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 5, false)
		elif level == 47:
			Level.spawn("ChairEars", 1, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Table2", 11, true)
			Level.spawn("Table", 7, true)
			Level.spawn("Stand", 9, true)
			Level.spawn("Puff", 16, false)
		elif level == 48:
			Level.spawn("ChairEars", 2, false)
			Level.spawn("Shelf", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("CoffeeTable", 11, false)
			Level.spawn("Stand", 13, true)
			Level.spawn("Puff", 15, false)
		elif level == 49:
			Level.spawn("ArmChair", 3, true)
			Level.spawn("Puff", 4, false)
			Level.spawn("ChairEars", 5, false)
			Level.spawn("CoffeeTable", 11, false)
			Level.spawn("Shelf", 13, false)
			Level.spawn("Stand", 16, false)
		elif level == 50:
			Level.spawn("Box", 1, true)
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Shelf", 9, true)
			Level.spawn("Puff", 12, false)
			Level.spawn("ArmChair", 15, true)
		elif level == 51:
			Level.spawn("ArmChair", 2, true)
			Level.spawn("ArmChair", 4, true)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Puff", 7, false)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 14, false)
		elif level == 52:
			Level.spawn("Stand", 2, false)
			Level.spawn("ArmChair", 3, true)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 11, false)
			Level.spawn_plug(9)
		elif level == 53:
			Level.spawn("Puff", 4, false)
			Level.spawn("Shelf", 5, true)
			Level.spawn("Table2", 11, true)
			Level.spawn("Stand", 9, true)
			Level.spawn("Table", 7, true)
		elif level == 54:
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Shelf", 5, true)
			Level.spawn("Puff", 6, false)
			Level.spawn("Sofa2", 13, true)
			Level.spawn("Sofa", 9, true)
			Level.spawn("Puff", 14, false)
			Level.spawn("Stand", 16, false)
			Level.spawn_plug(9)
		elif level == 55:
			Level.spawn("ChairEars", 2, false)
			Level.spawn("Puff", 3, false)
			Level.spawn("ChairEars", 5, true)
			Level.spawn("ChairEars", 8, true)
			Level.spawn("Puff", 9, false)
			Level.spawn("ChairEars", 10, true)
			Level.spawn("ArmChair", 11, false)
		elif level == 56:
			Level.spawn("Stand", 3, false)
			Level.spawn("Shelf", 5, true)
			Level.spawn("Puff", 6, false)
			Level.spawn("Stand", 10, true)
			Level.spawn("Stand", 13, true)
			Level.spawn("ChairEars", 15, false)
		elif level == 57:
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("Candle", 7, false)
			Level.spawn("Puff", 8, false)
			Level.spawn("Puff", 15, false)
		elif level == 58:
			Level.spawn("Sofa2", 6, false)
			Level.spawn("Sofa", 7, false)
			Level.spawn("TV", 9, true)
		elif level == 59:
			Level.spawn("Puff", 2, false)
			Level.spawn("Stand", 3, false)
			Level.spawn("Lamp", 3, false)
			Level.spawn("Sofa2", 10, false)
			Level.spawn("Sofa", 11, false)
		elif level == 60:
			Level.spawn("Puff", 3, false)
			Level.spawn("TV", 5, true)
			Level.spawn("Lamp", 8, false)
			Level.spawn("Bed", 11, false)
			Level.spawn("Puff", 14, false)
		elif level == 61:
			Level.spawn("TV", 1, false)
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
		elif level == 62:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Bed", 11, false)
			Level.spawn("Stand", 14, false)
			Level.spawn("Candle", 14, false)
			Level.spawn_plug(5)
		elif level == 63:
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("Stand", 6, false)
			Level.spawn("Stand", 8, false)
			Level.spawn("Candle", 11, false)
		elif level == 64:
			Level.spawn("Stand", 4, false)
			Level.spawn("Candle", 4, false)
			Level.spawn("ArmChair", 7, false)
			Level.spawn("Sofa2", 14, true)
			Level.spawn("Sofa", 10, true)
		elif level == 65:
			Level.spawn("Puff", 4, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Candle", 6, false)
			Level.spawn("Table", 7, false)
			Level.spawn("Stand", 9, true)
			Level.spawn("Puff", 11, false)
		elif level == 66:
			Level.spawn("ChairEars", 2, false)
			Level.spawn("Table2", 6, false)
			Level.spawn("Candle", 6, false)
			Level.spawn("Table", 7, false)
			Level.spawn("Puff", 9, false)
			Level.spawn("Stand", 13, true)
		elif level == 67:
			Level.spawn("Shelf", 1, false)
			Level.spawn("ChairEars", 2, false)
			Level.spawn("Candle", 7, false)
			Level.spawn("Puff", 11, false)
			Level.spawn("Puff", 14, false)
		elif level == 68:
			Level.spawn("TV", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 13, false)
		elif level == 69:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Stand", 5, true)
			Level.spawn("Lamp", 5, false)
			Level.spawn("Puff", 8, false)
			Level.spawn("Puff", 9, false)
			Level.spawn("Stand", 15, true)
		elif level == 70:
			Level.spawn("ArmChair", 4, false)
			Level.spawn("Table2", 10, true)
			Level.spawn("Table", 6, true)
			Level.spawn("Table2", 11, true)
			Level.spawn("Table", 7, true)
			Level.spawn("Lamp", 11, false)
			Level.spawn("ChairEars", 13, true)
			Level.spawn("Puff", 15, false)
		elif level == 71:
			Level.spawn("Stand", 1, false)
			Level.spawn("Lamp", 1, false)
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 8, false)
			Level.spawn("TV", 14, true)
			Level.spawn("Puff", 16, false)
			Level.spawn_plug(3)
		elif level == 72:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Shelf", 4, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn_plug(9)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("CoffeeTable", 10, false)
			Level.spawn("Candle", 10, false)
			Level.spawn("Puff", 14, false)
		elif level == 73:
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Table2", 10, true)
			Level.spawn("Table", 6, true)
			Level.spawn("Candle", 6, false)
			Level.spawn("Puff", 7, false)
		elif level == 74:
			Level.spawn("Stand", 2, false)
			Level.spawn("Lamp", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("ChairEars", 5, true)
			Level.spawn("Bed", 10, true)
		elif level == 75:
			Level.spawn("Stand", 1, false)
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 9, false)
			Level.spawn("Puff", 11, false)
			Level.spawn("TV", 13, true)
		elif level == 76:
			Level.spawn("Puff", 1, false)
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("Table2", 9, true)
			Level.spawn("Table", 5, true)
			Level.spawn("Lamp", 5, false)
			Level.spawn("ChairEars", 15, true)
		elif level == 77:
			Level.spawn("Shelf", 2, false)
			Level.spawn("TV", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("CoffeeTable", 6, false)
			Level.spawn("Puff", 8, false)
			Level.spawn("Puff", 10, false)
		elif level == 78:
			Level.spawn("Shelf", 1, true)
			Level.spawn("Stand", 2, false)
			Level.spawn("Lamp", 2, false)
			Level.spawn("ArmChair", 3, false)
			Level.spawn("Stand", 5, true)
			Level.spawn("Puff", 8, false)
			Level.spawn("Bed", 10, true)
		elif level == 79:
			Level.spawn("Stand", 1, false)
			Level.spawn("Sofa2", 3, false)
			Level.spawn("Sofa", 4, false)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("Puff", 12, false)
			Level.spawn("TV", 15, true)
		elif level == 80:
			Level.spawn("ArmChair", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Puff", 10, false)
			Level.spawn("Table2", 11, true)
			Level.spawn("Table", 7, true)
			Level.spawn("Candle", 11, false)
			Level.spawn("Stand", 13, true)
			Level.spawn("Lamp", 13, false)
			Level.spawn("Puff", 15, false)
		elif level == 81:
			Level.spawn("Puff", 2, false)
			Level.spawn("TV", 5, true)
			Level.spawn("Puff", 6, false)
			Level.spawn("Puff", 9, false)
		elif level == 82:
			Level.spawn("Puff", 1, false)
			Level.spawn("Stand", 2, true)
			Level.spawn("Candle", 2, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("TV", 8, false)
			Level.spawn("CoffeeTable", 11, false)
			Level.spawn("Puff", 13, false)
			Level.spawn("Puff", 16, false)
			Level.spawn_plug(9)
		elif level == 83:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn_plug(2)
			Level.spawn("Shelf", 4, false)
			Level.spawn("ArmChair", 9, true)
			Level.spawn("Table2", 11, true)
			Level.spawn("Table", 7, true)
			Level.spawn("Lamp", 7, false)
		elif level == 84:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Sofa2", 9, true)
			Level.spawn("Sofa", 5, true)
			Level.spawn("Stand", 13, false)
			Level.spawn("Lamp", 13, false)
			Level.spawn("Candle", 8, false)
			Level.spawn("Puff", 10, false)
			Level.spawn("Puff", 11, false)
			Level.spawn("TV", 12, false)
			Level.spawn_plug(5)
		elif level == 85:
			Level.spawn("ArmChair", 1, true)
			Level.spawn("Puff", 2, false)
			Level.spawn("TV", 5, true)
			Level.spawn("Bed", 10, true)
			Level.spawn("ArmChair", 8, false)
		elif level == 86:
			Level.spawn("Puff", 1, false)
			Level.spawn("Shelf", 2, false)
			Level.spawn("Puff", 3, false)
			Level.spawn("ArmChair", 4, false)
			Level.spawn("Stand", 6, false)
			Level.spawn("Candle", 6, false)
			Level.spawn("Puff", 10, false)
			Level.spawn("Puff", 15, false)
		elif level == 87:
			Level.spawn("CoffeeTable", 1, false)
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("ArmChair", 5, false)
			Level.spawn("Table2", 7, false)
			Level.spawn("Table", 8, false)
			Level.spawn("Lamp", 7, false)
			Level.spawn("Puff", 10, false)
			Level.spawn("CoffeeTable", 16, false)
			Level.spawn("Candle", 16, false)
		elif level == 88:
			Level.spawn("Sofa2", 5, true)
			Level.spawn("Sofa", 1, true)
			Level.spawn("Bed", 3, true)
			Level.spawn("Stand", 9, false)
			Level.spawn("CoffeeTable", 13, false)
			Level.spawn("Candle", 9, false)
			Level.spawn("Lamp", 14, false)
			Level.spawn("Bed", 10, true)
			Level.spawn("Puff", 15, false)
		elif level == 89:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("CoffeeTable", 5, false)
			Level.spawn("Candle", 5, false)
			Level.spawn("Puff", 7, false)
			Level.spawn("Puff", 10, false)
		elif level == 90:
			Level.spawn("Puff", 1, false)
			Level.spawn("Shelf", 3, false)
			Level.spawn("Stand", 4, false)
			Level.spawn("Sofa2", 10, true)
			Level.spawn("Sofa", 6, true)
			Level.spawn("Lamp", 8, false)
			Level.spawn("Puff", 11, false)
			Level.spawn("Bed", 13, true)
			Level.spawn("CoffeeTable", 14, false)
			Level.spawn("Candle", 14, false)
		elif level == 91:
			Level.spawn("Sofa2", 5, true)
			Level.spawn("Sofa", 1, true)
			Level.spawn("TV", 3, false)
			Level.spawn("Stand", 4, false)
			Level.spawn("ArmChair", 13, true)
			Level.spawn("Stand", 10, false)
			Level.spawn("Candle", 10, false)
			Level.spawn("Puff", 8, false)
		elif level == 92:
			Level.spawn("TV", 2, true)
			Level.spawn_plug(2)
			Level.spawn("Shelf", 6, false)
			Level.spawn("Puff", 13, false)
			Level.spawn("Puff", 4, false)
			Level.spawn("CoffeeTable", 7, false)
			Level.spawn("Candle", 10, false)
			Level.spawn("Stand", 11, true)
			Level.spawn("Candle", 12, false)
			Level.spawn("Puff", 16, false)
		elif level == 93:
			Level.spawn("Sofa2", 2, false)
			Level.spawn("Sofa", 3, false)
			Level.spawn("Puff", 5, false)
			Level.spawn("Puff", 8, false)
			Level.spawn_plug(2)
func _process(_delta):
	if cat_numeration_set == false:
		if card_amount == 1 and FirstCard.Cat != null:
			FirstCard.Cat.cat_numeration = 1
		elif card_amount == 2 and SecondCard.Cat != null:
			FirstCard.Cat.cat_numeration = 1
			SecondCard.Cat.cat_numeration = 2
		elif card_amount == 3 and ThirdCard.Cat != null:
			FirstCard.Cat.cat_numeration = 1
			SecondCard.Cat.cat_numeration = 2
			ThirdCard.Cat.cat_numeration = 3
		elif card_amount == 4 and FourthCard.Cat != null:
			FirstCard.Cat.cat_numeration = 1
			SecondCard.Cat.cat_numeration = 2
			ThirdCard.Cat.cat_numeration = 3
			FourthCard.Cat.cat_numeration = 4
		cat_numeration_set = true
	#preferences managment
	
	#addition: if preferences info [3] != null, then frame == 6
	# from 6 to 10 frames - hidden pref
	
			


			
		furniture_set = true
			
#
#	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
#		if UI.in_mouse_area:
#			print("in mouse area")
#			Camera.position.x = get_viewport().get_mouse_position().x 
	
	#camera limits
#	if Camera.zoom > Vector2(1.3, 1.3):
#		Camera.set_zoom(Vector2(1.3,1.3))
#	if Camera.zoom < Vector2(0.7, 0.7):
#		Camera.set_zoom(Vector2(0.7,0.7))
#	if Camera.position.x < 0:
#		Camera.position.x = 0
#	if Camera.position.x > 1200:
#		Camera.position.x = 1200
	
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
	
		
		
