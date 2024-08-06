extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click") and not Input.is_action_just_released("click"):
		$BackGround.position.direction_to(get_viewport().get_mouse_position())


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_menu.tscn")
