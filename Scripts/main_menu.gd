extends Control

@onready var Sound = $ButtonSound
@onready var CatT = $Control2/Cat
@onready var ControlT = $Control2
# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_to_load = "LevelMenu"
	EventBus.emit_signal("scene_change_requested", scene_to_load)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
#		$BackGround.position.direction_to(get_viewport().get_mouse_position())
	CatT.position.x = ControlT.size.x/2 - 1050
	CatT.global_position.y = $Chair.global_position.y - 1420
	pass
func _on_play_pressed():
	EventBus.play_button_sound.emit()
	var scene_to_load = "LevelMenu"  # Путь к сцене, которую нужно загрузить
	EventBus.scene_change_requested.emit(scene_to_load) # Испускаем сигнал с параметром


func _on_settings_pressed():
	EventBus.play_button_sound.emit()
	var New_Menu = load("res://Scenes/settings.tscn")
	var instance = New_Menu.instantiate()
	add_child(instance)




func _on_about_us_pressed():
	OS.shell_open("https://www.youtube.com/channel/UCtW6pDIWvoEI3qdjgeUQBlA")
