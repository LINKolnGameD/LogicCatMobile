extends Control

signal scene_change_requested
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
		$BackGround.position.direction_to(get_viewport().get_mouse_position())


func _on_play_pressed():
	var scene_to_load = "LevelMenu"  # Путь к сцене, которую нужно загрузить
	emit_signal("scene_change_requested", scene_to_load)  # Испускаем сигнал с параметром
