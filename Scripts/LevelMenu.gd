extends Control

signal level_choice
var level_number: int 
var successful_levels = []
var vary_successful_levels = []

var sound_mod: bool = true
@onready var ButtonKeeper = $MarginContainer2/ScrollContainer/CenterContainer/GridContainer
@onready var Margin = $MarginContainer2
@onready var CenterCon = $MarginContainer2/ScrollContainer/CenterContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in get_parent().get_parent().level_progress:
		successful_levels.append(str(i))

	#если эта кнопка есть как успешный уровень, то ок, если нет, то кнопка не работает
	for i in ButtonKeeper.get_children():
		if successful_levels.has(i.name):
			i.disabled = false
		else:
			i.disabled = true
			if len(successful_levels) == 0:
				$MarginContainer2/ScrollContainer/CenterContainer/GridContainer/Level_1.disabled = false
			elif ButtonKeeper.get_children()[ButtonKeeper.get_children().find(i) - 1].disabled == false and successful_levels.has(ButtonKeeper.get_children()[ButtonKeeper.get_children().find(i) - 1].name):
				i.disabled = false
	vary_successful_levels = get_parent().get_parent().completed_levels
	for i in ButtonKeeper.get_children():
		if vary_successful_levels.has(i.name):
			i.modulate = Color(0.6,0.4,0.1)
	if Margin and Margin.size.x > 0 and Margin.size.y > 0:
		ButtonKeeper.add_theme_constant_override("h_separation", Margin.size.x / 8)
		ButtonKeeper.add_theme_constant_override("v_separation", Margin.size.y / 8)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Margin and Margin.size.x > 0 and Margin.size.y > 0:
		ButtonKeeper.add_theme_constant_override("h_separation", Margin.size.x / 8)
		ButtonKeeper.add_theme_constant_override("v_separation", Margin.size.y / 8)
		
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
