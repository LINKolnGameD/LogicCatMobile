extends Control

var level_number: int 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_1_pressed():
	level_number = 1
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_2_pressed():
	level_number = 2
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_3_pressed():
	level_number = 3
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_4_pressed():
	level_number = 4
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_5_pressed():
	level_number = 5
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_6_pressed():
	level_number = 6
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")

func _on_level_7_pressed():
	level_number = 7
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_8_pressed():
	level_number = 8
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_9_pressed():
	level_number = 9
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_10_pressed():
	level_number = 10
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_11_pressed():
	level_number = 11
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")


func _on_level_12_pressed():
	level_number = 12
	EventBus.what_level.emit(level_number)
	get_tree().change_scene_to_file("res://Scenes/Main_scene.tscn")
