extends Control

@onready var FinishMenu = $FinishMenu
@onready var SettingMenu = $SettingMenu
@onready var CleanSound = $CleanSound
@onready var AllCatCards: Array
@onready var RelishBar = $FinishMenu/RelishBar
@onready var MainScene = $"../.."
@onready var Next = $FinishMenu/Next
@onready var Reset = $MarginContainer/Reset
@onready var ArrowRight = $"../ArrRight"
@onready var ArrowLeft = $"../ArrLeft"
@onready var CatCont = $"../HBoxContainer"
var ArrRight_in = false
var ArrLeft_in = false
var CatState = 1

var bar_count
var final_satisfaction = 0
var final_frame
var level

var arrows_set: bool = false
var in_mouse_area: bool
var get_level = false
var play_education 

var mouse_in:bool = false
var mouse_in2:bool = false
var mouse_in3:bool = false
var mouse_in4:bool = false

func _ready():
	FinishMenu.hide()
	SettingMenu.hide()
	EventBus.change_sound_second.connect(sound_change)
	if get_parent().get_parent().get_parent().global_sound_mod == false:
		CleanSound.volume_db = -80
		
		
func _process(delta):
	print(mouse_in, mouse_in2, mouse_in3, mouse_in4)
#
	if MainScene.card_amount == 4:
		if CatState == 1:
			CatCont.position.x = 169
			ArrowLeft.hide()
			ArrowRight.show()
		elif CatState == 2:
			CatCont.position.x = -838
			ArrowLeft.show()
			ArrowRight.hide()
	else:
		if arrows_set == false:
			ArrowLeft.queue_free()
			ArrowRight.queue_free()
			arrows_set = true
	print(final_satisfaction)
	Reset.scale = Vector2(0.9, 0.9)
	
	if get_level == false:
		if MainScene.level != null:
			level = MainScene.level
			get_level = true
	bar_count = MainScene.CatsSatisfaction
	
	
			
	if final_satisfaction == 0:
		Next.disabled = true
	else:
		Next.disabled = false
			


func _on_next_pressed():
	EventBus.play_button_sound.emit()
	print("on next pressed")
	get_tree().paused = false
	MainScene.get_parent().global_level_info += 1
	var scene_to_load = "MainScene" 
	EventBus.scene_change_requested.emit(scene_to_load) # Путь к сцене, которую нужно загрузить
#	emit_signal("scene_change_requested", scene_to_load)  # Испускаем сигнал с параметром

func _on_restart_pressed():
	EventBus.play_button_sound.emit()
	get_tree().paused = false
	var scene_to_load = "MainScene"  # Путь к сцене, которую нужно загрузить
	EventBus.scene_change_requested.emit(scene_to_load)  # Испускаем сигнал с параметром

func _on_reset_pressed():
	get_tree().paused = false
	CleanSound.play()
	AllCatCards = $"../HBoxContainer".get_children()
	for i in AllCatCards:
		i.Cat.current_state = 1

#
#func _on_mouse_area_mouse_entered():
#	print("mouse enterd")
#	in_mouse_area = true

#
#func _on_mouse_area_mouse_exited():
#	print("mouse exited")
#	in_mouse_area = false


func _on_mouse_area_mouse_shape_entered(shape_idx):
	print("mouse enterd")


func _on_check_pressed():
	EventBus.play_button_sound.emit()
	if MainScene.CardArray.all(content_no_cat):
		$Check.disabled = true
		for e in bar_count:
			final_satisfaction += e
		final_satisfaction = final_satisfaction/len(bar_count)
		final_frame = roundi(final_satisfaction/8.3)
		FinishMenu.show()
		get_tree().paused = true
		if final_satisfaction > 0:
			EventBus.add_succes.emit(level)
			if final_satisfaction == 100:
				EventBus.add_very_succes.emit(level)
			RelishBar.play("default")
			$CPUParticles2D.emitting = true
			$CPUParticles2D2.emitting = true
			$CPUParticles2D3.emitting = true
func content_no_cat(node):
	if node.get_children().find(node.Cat) == -1:
		return true
	else:
		return false
	
func _on_timer_timeout():
	if final_frame != null:
		$FinishMenu/RelishBar.play("default")


func _on_arr_right_area_2d_mouse_entered():
	ArrRight_in = true


func _on_arr_left_area_2d_mouse_entered():
	ArrLeft_in = true


func _on_arr_right_area_2d_mouse_exited():
	ArrRight_in = false


func _on_arr_left_area_2d_mouse_exited():
	ArrLeft_in = false


func _on_menu_pressed():
	EventBus.play_button_sound.emit()
	get_tree().paused = true
	SettingMenu.show()


func _on_quit_pressed():
	EventBus.play_button_sound.emit()
	var scene_to_load = "LevelMenu"
	get_tree().paused = false
	EventBus.scene_change_requested.emit(scene_to_load)


func _on_to_game_pressed():
	EventBus.play_button_sound.emit()
	get_tree().paused = false
	SettingMenu.hide()


func _on_settings_pressed():
	EventBus.play_button_sound.emit()
	var New_Menu = load("res://Scenes/settings.tscn")
	var instance = New_Menu.instantiate()
	add_child(instance)
	instance.global_position = Vector2(0,0)
	SettingMenu.hide()
	
func sound_change(mod):
	if mod:
		CleanSound.volume_db = 10
	else:
		CleanSound.volume_db = -80


func _on_relish_bar_frame_changed():
	if RelishBar.frame == final_frame:
		RelishBar.pause()



func _on_arr_right_pressed():
	if CatState == 1:
		CatState = 2

func _on_arr_right_2_pressed():
	if CatState == 2:
		CatState = 1

