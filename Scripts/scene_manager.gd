extends Node2D

var MainScene = "res://Scenes/Main_scene.tscn"
var LoadScene = "res://Scenes/loading_scene.tscn"
var MainMenu = "res://Scenes/main_menu.tscn"
var LevelMenu = "res://Scenes/level_menu.tscn"

var save_path = "user://savegame.save"


var global_level_info: int
var loader
var new_scene
var current_scene = null
var progress = []
var scene_load_status = 0
var new_scene_path
var object_loading = null  # Переменная для хранения ссылки на экран загрузки

# Called when the node enters the scene tree for the first time.
func _ready():
	loader = load(MainMenu)
	new_scene = loader.instantiate()  # Создаём экземпляр новой сцены
	add_child(new_scene)  # Добавляем её в дерево
	new_scene.connect("scene_change_requested", _on_scene_change_requested)
	EventBus.connect("scene_change_requested", _on_scene_change_requested)
	current_scene = new_scene
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(get_children())
	if new_scene_path != null:
		scene_load_status = ResourceLoader.load_threaded_get_status(new_scene_path, progress)
		if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
			# Загружаем новую сцену
			loader = ResourceLoader.load_threaded_get(new_scene_path)
			new_scene = loader.instantiate()
			
			# Добавляем новую сцену в дерево и удаляем старую
			add_child(new_scene)
			if current_scene != null:
				current_scene.queue_free()
			current_scene = new_scene

			# Подключаем сигналы для уровня
			if current_scene.name == "LevelMenu":
				new_scene.connect("level_choice", _open_level)
			

			# Удаляем экран загрузки
			if object_loading != null:
				object_loading.queue_free()
				object_loading = null  # Очищаем ссылку на объект

# Функция для обработки запроса на смену сцены
func _on_scene_change_requested(new_scene_path):
	print("Запрос на смену сцены: ", new_scene_path)
	change_scene(new_scene_path)

# Функция для смены сцены
func change_scene(scene_path):
	# Определяем путь к новой сцене
	if scene_path == "MainMenu":
		new_scene_path = MainMenu
	elif scene_path == "LevelMenu":
		new_scene_path = LevelMenu
	elif scene_path == "MainScene":
		new_scene_path = MainScene
	elif scene_path == "LoadScene":
		new_scene_path = LoadScene

	# Удаляем текущую сцену, если она существует
	if current_scene != null:
		current_scene.queue_free()

	# Показываем экран загрузки
	var loading = load("res://Scenes/loading_scene.tscn")
	object_loading = loading.instantiate()
	add_child(object_loading)

	# Начинаем асинхронную загрузку новой сцены
	ResourceLoader.load_threaded_request(new_scene_path)

# Функция для открытия уровня
func _open_level(level_number):
	print("Открытие уровня ", level_number)
	global_level_info = level_number
	change_scene("MainScene")
#	new_scene.connect("scene_change_requested", _on_scene_change_requested)
#
func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if new_scene_path == "LevelMenu":
		file.store_var(get_child(1).successful_levels)

func load_game():
	var file = FileAccess.open(save_path, FileAccess.READ)
	if new_scene_path == "LevelMenu":
		get_child(1).successful_levels = file.get_var(get_child(1).successful_levels)
