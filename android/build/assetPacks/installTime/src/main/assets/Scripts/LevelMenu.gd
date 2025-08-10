extends Control

signal level_choice
var level_number: int 
var successful_levels = []
var vary_successful_levels = []
var menu_mood = 1
var first_pack: PackedVector2Array = [Vector2(100, -400), Vector2(665, 153), Vector2(283, 492), Vector2(628, 614), Vector2(307, 676), Vector2(267, 1204), Vector2(600, 1114), Vector2(837, 1168), Vector2(837, 1505), Vector2(431, 1905), Vector2(910, 2419)]
var second_pack: PackedVector2Array = [Vector2(163, -180), Vector2(509, 411), Vector2(730, 205), Vector2(826, 1049), Vector2(191, 992), Vector2(313, 1420), Vector2(594, 871), Vector2(776, 1701), Vector2(404, 2461)]
var third_pack: PackedVector2Array = [Vector2(303, -174), Vector2(815, 695), Vector2(240, 392), Vector2(350, 1186), Vector2(809, 767), Vector2(845, 1402), Vector2(587, 1369), Vector2(249, 1582), Vector2(788, 1762), Vector2(-78, 2622)]
var fought_pack: PackedVector2Array = [Vector2(894, -205), Vector2(834, 715), Vector2(366, 1295), Vector2(250, 631), Vector2(806, 271), Vector2(282, 247), Vector2(766, 1511), Vector2(542, 1635), Vector2(242, 1515), Vector2(582, 1951), Vector2(170, 2411)]
var five_pack: PackedVector2Array = [Vector2(72, -245), Vector2(339, 504), Vector2(872, 517), Vector2(875, 1009), Vector2(606, 834), Vector2(225, 990), Vector2(691, 196), Vector2(802, 1695), Vector2(294, 1314), Vector2(625, 1987), Vector2(361, 2638)]
var six_pack: PackedVector2Array = [Vector2(941, -371), Vector2(253, 166), Vector2(290, 873), Vector2(543, 717), Vector2(790, 841), Vector2(794, 309), Vector2(193, 1317), Vector2(791, 1723), Vector2(262, 1761), Vector2(539, 1933), Vector2(506, 2573)]
var seven_pack: PackedVector2Array = [Vector2(397, -231), Vector2(303, 558), Vector2(831, 298), Vector2(216, 740), Vector2(831, 1204), Vector2(242, 1397), Vector2(273, 1593), Vector2(850, 1517), Vector2(537, 1770)]
var pin_first_position = [Vector2(361, 1886), Vector2(0, 0), Vector2(-520, 958), Vector2(639, 36), Vector2(181, 429), Vector2(600, 498), Vector2(328, 1844), Vector2(808, 1389), Vector2(260, 1180), Vector2(219, 1180), Vector2(164, 1142), Vector2(494, 1050), Vector2(808, 1050), Vector2(245, 781),  Vector2(-951, 661)]
var pin_second_position = [Vector2(350, 2289), Vector2(0, 0), Vector2(461, 854), Vector2(704, 87), Vector2(406, 346), Vector2(798, 930), Vector2(65, -234), Vector2(163, 878), Vector2(-251, 1330), Vector2(-358, 1310), Vector2(319, 2247), Vector2(490, 815), Vector2(283, 1302), Vector2(714, 1809), Vector2(618, 178)]
var pin_third_pack = [Vector2(281, 1163), Vector2(0, 0), Vector2(-690, 806), Vector2(781, 572), Vector2(136, 335), Vector2(323, 1063), Vector2(201, -233), Vector2(227, 1469), Vector2(835, 1381), Vector2(185, 374), Vector2(-147, 2531), Vector2(702, 714), Vector2(814, 1283), Vector2(720, 1867), Vector2(-829, 555)]
var pin_fought_position = [Vector2(-829, 555), Vector2(0, 0), Vector2(-690, 806), Vector2(765, 162), Vector2(185, 192), Vector2(223, 516), Vector2(201, -233), Vector2(220, 1408), Vector2(810, 692), Vector2(752, 253), Vector2(475, 1894), Vector2(724, 661), Vector2(333, 1167), Vector2(698, 1610), Vector2(255, 1254)]
var pin_five_position = [Vector2(534, 820), Vector2(0, 0), Vector2(-690, 806), Vector2(308, 389), Vector2(588, 141), Vector2(837, 404), Vector2(127, 927), Vector2(268, 1199), Vector2(-359, 1136), Vector2(-255, 667), Vector2(519, 1920), Vector2(772, 942), Vector2(578, 727), Vector2(739, 1787), Vector2(179, 1288)]
var pin_six_position = [Vector2(-674, 967), Vector2(0, 0), Vector2(409, 714), Vector2(227, 49), Vector2(691, 258), Vector2(761, 721), Vector2(189, 806), Vector2(513, 629), Vector2(777, 301), Vector2(240, 839), Vector2(95, 1256), Vector2(686, 1661), Vector2(240, 1642), Vector2(475, 2035), Vector2(-784, 392)]
var pin_seven_position = [Vector2(-547, 1780), Vector2(0, 0), Vector2(-723, 1234), Vector2(276, 438), Vector2(726, 237), Vector2(188, 622), Vector2(725, 1139), Vector2(361, -298), Vector2(-354, 759), Vector2(172, 714), Vector2(141, 1335), Vector2(291, 1644), Vector2(653, 1588), Vector2(212, 1692), Vector2(336, 622)]
var f_to_15_button = [Vector2(132, 56), Vector2(316, 126), Vector2(282, 308), Vector2(550, 214), Vector2(421, 452), Vector2(639, 540), Vector2(479, 716), Vector2(846, 777), Vector2(559, 980), Vector2(808, 1127), Vector2(821.736, 1353), Vector2(639, 1277), Vector2(767, 1589), Vector2(569, 1591), Vector2(386, 1774)]
var fift_to_30_button = [Vector2(425, 36), Vector2(252, 135), Vector2(281, 345), Vector2(153, 470), Vector2(474, 440), Vector2(353, 550), Vector2(709, 410), Vector2(650, 558), Vector2(618, 1006), Vector2(883, 1182), Vector2(838, 1378), Vector2(653, 1414), Vector2(618, 1628), Vector2(391, 1545), Vector2(481, 1754)]
var thirty_to_45_button = [Vector2(785, 36), Vector2(582, 89), Vector2(690, 227), Vector2(481, 281), Vector2(690, 481), Vector2(316, 572), Vector2(690, 702), Vector2(475, 846), Vector2(737.606, 896), Vector2(527.606, 1050), Vector2(737.606, 1126), Vector2(605.606, 1357), Vector2(437.185, 1450), Vector2(607.185, 1563), Vector2(424.185, 1709)]
var fortyfive_to_60_button = [Vector2(769, 36), Vector2(817, 227), Vector2(540, 162), Vector2(546, 374), Vector2(390, 627), Vector2(390, 644), Vector2(227, 832), Vector2(546, 806), Vector2(546, 1041), Vector2(795, 1051), Vector2(841, 1274), Vector2(634, 1274), Vector2(638, 1468), Vector2(390, 1545), Vector2(422, 1747)]
var sexty_to_75_button = [Vector2(272, 83), Vector2(436, 192), Vector2(397, 335), Vector2(582, 347), Vector2(667, 517), Vector2(140, 667), Vector2(312, 772), Vector2(272, 972), Vector2(538, 1006), Vector2(690, 1172), Vector2(889, 1372), Vector2(690, 1301), Vector2(738, 1501), Vector2(512, 1523), Vector2(312, 1664)]
var seventy_to_90_button = [Vector2(674.205, 0), Vector2(674.205, 191), Vector2(473.205, 126), Vector2(313.205, 265), Vector2(473.205, 326), Vector2(341.205, 488), Vector2(850, 839), Vector2(659, 935), Vector2(390, 1095), Vector2(621, 1157), Vector2(489, 1328), Vector2(781, 1340), Vector2(616, 1523), Vector2(390, 1664), Vector2(690, 1693)]
var night_to_105_button = [Vector2(2042, 4008), Vector2(140, 36), Vector2(340, 36), Vector2(305, 236), Vector2(505, 192), Vector2(540, 352), Vector2(690, 392), Vector2(690, 522), Vector2(836, 687), Vector2(713, 752), Vector2(713, 932), Vector2(582, 913), Vector2(738, 1199), Vector2(490, 1143), Vector2(604, 1328), Vector2(450, 1401)]
var sound_mod: bool = true
@onready var ButtonKeeper = $MarginContainer2/Levels
@onready var Margin = $MarginContainer2
@onready var CenterCon = $MarginContainer2/ScrollContainer/CenterContainer
@onready var Line = $MarginContainer2/Pin/Line
@onready var Back = $NextBackKeeper/HBoxContainer/Back
@onready var Next = $NextBackKeeper/HBoxContainer/Next
@onready var Pin = $MarginContainer2/Pin
@onready var V_Feather = $MarginContainer2/Pin/Violet_Feather
@onready var B_Feather = $MarginContainer2/Pin/Blue_Feather 
@onready var MousePin = $MarginContainer2/Pin/MousePin
# Called when the node enters the scene tree for the first time.
func _ready():
#	var number = 1
#	for i in $MarginContainer2/Pin.get_children():
#		pin_seven_position.append(i.position)
#	print(pin_seven_position)
#	for i in $MarginContainer2/Levels.get_children():
#		if number > 105 or number < 90:
#			number += 1
#		else:
#			print(number)
#			night_to_105_button.append(i.global_position)
#			number += 1
#	print(night_to_105_button)
#	print(Line.points)
	Margin.add_theme_constant_override("margin_top", get_window().size.y/50)
	var red_paw = load("res://Scenes/Cats/redpaw.tres")
	var white_paw = load("res://Scenes/Cats/whitepaw.tres")
	for i in get_parent().get_parent().level_progress:
		successful_levels.append(str(i))
	vary_successful_levels = get_parent().get_parent().completed_levels
	#если эта кнопка есть как успешный уровень, то ок, если нет, то кнопка не работает
	for i in ButtonKeeper.get_children():
		if successful_levels.has(i.name):
			i.disabled = false
		else:
			i.disabled = true
			if len(successful_levels) == 0:
				$MarginContainer2/Levels/Level_1.disabled = false
			elif ButtonKeeper.get_children()[ButtonKeeper.get_children().find(i) - 1].disabled == false and successful_levels.has(ButtonKeeper.get_children()[ButtonKeeper.get_children().find(i) - 1].name):
				i.disabled = false
	vary_successful_levels = get_parent().get_parent().completed_levels
	for i in ButtonKeeper.get_children():
		if vary_successful_levels.has(i.name):
				i.icon = white_paw
		else:
				i.icon = red_paw
#			if Margin and Margin.size.x > 0 and Margin.size.y > 0:
#				ButtonKeeper.add_theme_constant_override("h_separation", Margin.size.x / 8)
#				ButtonKeeper.add_theme_constant_override("v_separation", Margin.size.y / 8)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var number = 0
	for i in ButtonKeeper.get_children():
		if menu_mood == 1:
			for e in Pin.get_children():
				e.position = pin_first_position[Pin.get_children().find(e)]
			Line.points = first_pack
			Back.show()
			Back.disabled = true
			Next.disabled = false
			Next.show()
			
			if number < 15:
				i.show()
				i.position = f_to_15_button[ButtonKeeper.get_children().find(i)]
				number += 1
			else:
				i.hide()
		elif menu_mood == 2:
			for e in Pin.get_children():
				e.position = pin_second_position[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.disabled = false
			Next.show()
			Line.points = second_pack
			if number < 15:
				i.hide()
				number += 1
			else:
				if number < 30:
					i.show()
					i.position = fift_to_30_button[ButtonKeeper.get_children().find(i)-15]
					number += 1
				else:
					i.hide()
		elif menu_mood == 3:
			for e in Pin.get_children():
				e.position = pin_third_pack[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.disabled = false
			Next.show()
			Line.points = third_pack
			if number < 30:
				i.hide()
				number += 1
			else:
				if number < 45:
					i.show()
					i.global_position = thirty_to_45_button[ButtonKeeper.get_children().find(i)-30]
					number += 1
				else:
					i.hide()
		elif menu_mood == 4:
			for e in Pin.get_children():
				e.position = pin_fought_position[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.disabled = false
			Next.show()
			Line.points = fought_pack
			if number < 45:
				i.hide()
				number += 1
			else:
				if number < 60:
					i.show()
					i.global_position = fortyfive_to_60_button[ButtonKeeper.get_children().find(i)-45]
					number += 1
				else:
					i.hide()
		elif menu_mood == 5:
			for e in Pin.get_children():
				e.position = pin_five_position[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.disabled = false
			Next.show()
			Line.points = five_pack
			if number < 60:
				i.hide()
				number += 1
			else:
				if number < 75:
					i.show()
					i.global_position = sexty_to_75_button[ButtonKeeper.get_children().find(i)-60]
					number += 1
				else:
					i.hide()
		elif menu_mood == 6:
			for e in Pin.get_children():
				e.position = pin_six_position[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.show()
			Next.disabled = false
			Line.points = six_pack
			$Creative.hide()
			if number < 75:
				i.hide()
				number += 1
			else:
				if number < 90:
					i.show()
					i.position = seventy_to_90_button[ButtonKeeper.get_children().find(i)-75]
					print(i.position)
					number += 1
				else:
					i.hide()
		elif menu_mood == 7:
			for e in Pin.get_children():
				e.position = pin_seven_position[Pin.get_children().find(e)]
			Back.show()
			Back.disabled = false
			Next.show()
			Next.disabled = true
			Line.points = seven_pack
			$Creative.show()
			if number < 90:
				i.hide()
				number += 1
			else:
				if number < 105:
					i.show()
					i.position = night_to_105_button[ButtonKeeper.get_children().find(i)-105]
					print(i.position)
					number += 1
				else:
					i.hide()
#	if Margin and Margin.size.x > 0 and Margin.size.y > 0:
#		ButtonKeeper.add_theme_constant_override("h_separation", Margin.size.x / 8)
#		ButtonKeeper.add_theme_constant_override("v_separation", Margin.size.y / 8)
		
func _on_level_1_pressed():
	level_number = 1
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_2_pressed():
	level_number = 2
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_3_pressed():
	level_number = 3
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_4_pressed():
	level_number = 4
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_5_pressed():
	level_number = 5
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_6_pressed():
	level_number = 6
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_7_pressed():
	level_number = 7
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_8_pressed():
	level_number = 8
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_9_pressed():
	level_number = 9
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_10_pressed():
	level_number = 10
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_11_pressed():
	level_number = 11
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_12_pressed():
	level_number = 12
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_13_pressed():
	level_number = 13
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_14_pressed():
	level_number = 14
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_15_pressed():
	level_number = 14
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_16_pressed():
	level_number = 16
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_17_pressed():
	level_number = 17
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_18_pressed():
	level_number = 18
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_19_pressed():
	level_number = 19
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_20_pressed():
	level_number = 20
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_21_pressed():
	level_number = 21
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_22_pressed():
	level_number = 22
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_23_pressed():
	level_number = 23
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_24_pressed():
	level_number = 24
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_25_pressed():
	level_number = 25
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_26_pressed():
	level_number = 26
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_27_pressed():
	level_number = 27
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_28_pressed():
	level_number = 28
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_29_pressed():
	level_number = 29
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_30_pressed():
	level_number = 30
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_31_pressed():
	level_number = 31
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_32_pressed():
	level_number = 32
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_33_pressed():
	level_number = 33
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_34_pressed():
	level_number = 34
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_35_pressed():
	level_number = 35
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_36_pressed():
	level_number = 36
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_37_pressed():
	level_number = 37
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_38_pressed():
	level_number = 38
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_39_pressed():
	level_number = 39
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_40_pressed():
	level_number = 40
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_41_pressed():
	level_number = 41
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_42_pressed():
	level_number = 42
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_43_pressed():
	level_number = 43
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_44_pressed():
	level_number = 44
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_45_pressed():
	level_number = 45
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_46_pressed():
	level_number = 46
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_47_pressed():
	level_number = 47
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_48_pressed():
	level_number = 48
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_49_pressed():
	level_number = 49
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_50_pressed():
	level_number = 50
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_51_pressed():
	level_number = 51
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_52_pressed():
	level_number = 52
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_53_pressed():
	level_number = 53
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_54_pressed():
	level_number = 54
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_55_pressed():
	level_number = 55
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_56_pressed():
	level_number = 56
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_57_pressed():
	level_number = 57
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_58_pressed():
	level_number = 58
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_59_pressed():
	level_number = 59
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_60_pressed():
	level_number = 60
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_61_pressed():
	level_number = 61
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_62_pressed():
	level_number = 62
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_63_pressed():
	level_number = 63
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_64_pressed():
	level_number = 64
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_65_pressed():
	level_number = 65
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_66_pressed():
	level_number = 66
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_67_pressed():
	level_number = 67
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_68_pressed():
	level_number = 68
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_69_pressed():
	level_number = 69
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_70_pressed():
	level_number = 70
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_71_pressed():
	level_number = 71
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_72_pressed():
	level_number = 72
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_73_pressed():
	level_number = 73
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_74_pressed():
	level_number = 74
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_75_pressed():
	level_number = 75
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_76_pressed():
	level_number = 76
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_77_pressed():
	level_number = 77
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_78_pressed():
	level_number = 78
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_79_pressed():
	level_number = 79
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_80_pressed():
	level_number = 80
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_81_pressed():
	level_number = 81
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_82_pressed():
	level_number = 82
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_83_pressed():
	level_number = 83
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_84_pressed():
	level_number = 84
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_85_pressed():
	level_number = 85
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_86_pressed():
	level_number = 86
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_87_pressed():
	level_number = 87
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_88_pressed():
	level_number = 88
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_89_pressed():
	level_number = 89
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_90_pressed():
	level_number = 90
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_91_pressed():
	level_number = 91
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_92_pressed():
	level_number = 92
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_93_pressed():
	level_number = 93
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_94_pressed():
	level_number = 94
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_95_pressed():
	level_number = 95
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_96_pressed():
	level_number = 96
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_97_pressed():
	level_number = 97
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_98_pressed():
	level_number = 98
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_99_pressed():
	level_number = 99
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_100_pressed():
	level_number = 100
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_101_pressed():
	level_number = 101
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_102_pressed():
	level_number = 102
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_103_pressed():
	level_number = 103
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_104_pressed():
	level_number = 104
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_105_pressed():
	level_number = 105
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_106_pressed():
	level_number = 106
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_107_pressed():
	level_number = 107
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_108_pressed():
	level_number = 108
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_109_pressed():
	level_number = 109
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_110_pressed():
	level_number = 110
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()


func _on_level_111_pressed():
	level_number = 111
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()
	
func _on_level_112_pressed():
	level_number = 112
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()
	
func _on_level_113_pressed():
	level_number = 113
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_114_pressed():
	level_number = 114
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_115_pressed():
	level_number = 115
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_116_pressed():
	level_number = 116
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_117_pressed():
	level_number = 117
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_118_pressed():
	level_number = 118
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_119_pressed():
	level_number = 119
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_level_120_pressed():
	level_number = 120
	EventBus.level_choice.emit(level_number)
	EventBus.play_button_sound.emit()

func _on_menu_pressed():
	EventBus.scene_change_requested.emit("MainMenu")
	EventBus.play_button_sound.emit()





func _on_back_pressed():
	if menu_mood > 1:
		menu_mood -= 1
	if menu_mood == 1 or menu_mood == 2 or menu_mood == 3 or menu_mood == 4:
		V_Feather.texture = load("res://Scenes/Cats/violet_feather.tres")
		B_Feather.texture = load("res://Scenes/Cats/bluefeather.tres")
		MousePin.texture = load("res://Scenes/Cats/mousepin.tres")
		$MarginContainer2/Pin/Photo.texture = load("res://Scenes/Cats/photo1.tres")
	elif menu_mood == 4:
		V_Feather.texture = load("res://Scenes/Cats/greenfeather.tres")
		B_Feather.texture = load("res://Scenes/Cats/darkfeather.tres")
		MousePin.texture = load("res://Scenes/Cats/mousepin.tres")
	else:
		V_Feather.texture = load("res://Scenes/Cats/violet_feather.tres")
		B_Feather.texture = load("res://Scenes/Cats/bluefeather.tres")
		MousePin.texture = load("res://Scenes/Cats/bowpin.tres")
		$MarginContainer2/Pin/Photo.texture = load("res://Scenes/Cats/photo2.tres")


func _on_next_pressed():
	if menu_mood < 7:
		menu_mood += 1
	if menu_mood == 1 or menu_mood == 2 or menu_mood == 3:
		V_Feather.texture = load("res://Scenes/Cats/violet_feather.tres")
		B_Feather.texture = load("res://Scenes/Cats/bluefeather.tres")
		MousePin.texture = load("res://Scenes/Cats/mousepin.tres")
		$MarginContainer2/Pin/Photo.texture = load("res://Scenes/Cats/photo1.tres")
	elif menu_mood == 4:
		V_Feather.texture = load("res://Scenes/Cats/greenfeather.tres")
		B_Feather.texture = load("res://Scenes/Cats/darkfeather.tres")
		MousePin.texture = load("res://Scenes/Cats/mousepin.tres")
	else:
		V_Feather.texture = load("res://Scenes/Cats/violet_feather.tres")
		B_Feather.texture = load("res://Scenes/Cats/bluefeather.tres")
		MousePin.texture = load("res://Scenes/Cats/bowpin.tres")
		$MarginContainer2/Pin/Photo.texture = load("res://Scenes/Cats/photo2.tres")
