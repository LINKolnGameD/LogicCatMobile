extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	var scene_to_load = "LevelMenu"
	EventBus.emit_signal("scene_change_requested", scene_to_load)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
		$BackGround.position.direction_to(get_viewport().get_mouse_position())

	pass
#func _on_play_pressed():
#	var scene_to_load = "LevelMenu"  # Путь к сцене, которую нужно загрузить
#	print("pressed")
#	EventBus.emit_signal("scene_change_requested", scene_to_load)  # Испускаем сигнал с параметром


func _on_play_button_down():
	var scene_to_load = "LevelMenu"  # Путь к сцене, которую нужно загрузить
	print("pressed")
	EventBus.emit_signal("scene_change_requested", scene_to_load)
