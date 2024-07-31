extends Control

@onready var FinishMenu = $FinishMenu
@onready var AllCatCards: Array
var ArrRight_in = false
var ArrLeft_in = false
var CatState = 1


var bar_count
var final_satisfaction = 0
var final_frame

var in_mouse_area: bool

func _ready():
	FinishMenu.hide()

func _process(delta):
	bar_count = $"../..".CatsSatisfaction
	if $FinishMenu/RelishBar.frame == final_frame:
		$FinishMenu/RelishBar.frame = final_frame
		
	if $"../..".card_amount == 4:
		if CatState == 1:
			$"../HBoxContainer".position.x = 169
			$"../ArrLeftArea2D".hide()
			$"../ArrRightArea2D".show()
		elif CatState == 2:
			$"../HBoxContainer".position.x = -838
			$"../ArrLeftArea2D".show()
			$"../ArrRightArea2D".hide()
		
	
	
	if ArrRight_in:
		if CatState == 1:
			if Input.is_action_just_pressed("click"):
				CatState = 2
	if ArrLeft_in:
		if CatState == 2:
			if Input.is_action_just_pressed("click"):
				CatState = 1
			
			


func _on_next_pressed():
	EventBus.global_level_info += 1
	get_tree().reload_current_scene()


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_reset_pressed():
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
	if $"../..".CardArray.all(content_no_cat):
		$Check.disabled = true
		for e in bar_count:
			final_satisfaction += e
		final_satisfaction = final_satisfaction/len(bar_count)
		final_frame = roundi(final_satisfaction/8.3)
		print(final_satisfaction)
		print(final_frame)
		FinishMenu.show()
		$Timer.start()
		
func content_no_cat(node):
	if node.get_children().find(node.Cat) == -1:
		return true
	else:
		return false
	
func _on_timer_timeout():
	print(final_frame)
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
