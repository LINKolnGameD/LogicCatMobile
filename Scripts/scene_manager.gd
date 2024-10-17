extends Node2D

var MainScene = "res://Scenes/Main_scene.tscn"
var LoadScene = "res://Scenes/loading_scene.tscn"
var MainMenu = "res://Scenes/main_menu.tscn"
var LevelMenu = "res://Scenes/level_menu.tscn"

var global_level_info
var loader
var new_scene
var current_scene = null
var progress = []
var scene_load_status = 0
var new_scene_path
# Called when the node enters the scene tree for the first time.
func _ready():
	loader = load(MainMenu)
	new_scene = loader.instantiate()  # Создаём экземпляр новой сцены
	add_child(new_scene)  # Добавляем её в дерево
	new_scene.connect("scene_change_requested", _on_scene_change_requested)
	current_scene = new_scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var loading = load("res://Scenes/loading_scene.tscn")
	var object_loading = loading.instantiate() 
	print(new_scene_path, " and ", progress, " and ", scene_load_status)
	if new_scene_path != null:
		scene_load_status = ResourceLoader.load_threaded_get_status(new_scene_path, progress)
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		loader = ResourceLoader.load_threaded_get(new_scene_path)
		new_scene = loader.instantiate()
		add_child(new_scene)
		current_scene = new_scene
		print(current_scene)
		if current_scene.name == "LevelMenu":
			new_scene.connect("level_choice", _open_level)
		object_loading.queue_free()
	
	
func _on_scene_change_requested(new_scene_path):
	print("Запрос на смену сцены: ", new_scene_path)
	change_scene(new_scene_path)  # Вызываем функцию смены сцены (например, ту, что ты реализуешь)

# Функция для смены сцены
func change_scene(scene_path):
	if scene_path == "MainMenu":
		new_scene_path = MainMenu
	elif scene_path == "LevelMenu":
		new_scene_path = LevelMenu
	elif scene_path == "MainScene":
		new_scene_path = MainScene
	elif scene_path == "LoadScene":
		new_scene_path = LoadScene
	if current_scene != null:
		current_scene.queue_free()  # Освобождаем текущую сцену
	var loading = load("res://Scenes/loading_scene.tscn")
	var object_loading = loading.instantiate() 
	add_child(object_loading)
	ResourceLoader.load_threaded_request(new_scene_path)
	

	
func _open_level(level_number):
	print("openning")
	global_level_info = level_number
	change_scene("MainScene")
