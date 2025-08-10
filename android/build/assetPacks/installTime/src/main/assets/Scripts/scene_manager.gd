extends Node2D

var MainScene = "res://Scenes/Main_scene.tscn"
var LoadScene = "res://Scenes/loading_scene.tscn"
var MainMenu = "res://Scenes/main_menu.tscn"
var LevelMenu = "res://Scenes/level_menu.tscn"

var save_path = "user://savegame.save"
@onready var Music = $AudioStreamPlayer
@onready var ButtonSound = $AudioStreamPlayer/GlobalSoundPlayer

var global_sound_mod: bool = true
var global_level_info: int
var current_scene = null
var progress = []
var level_progress = []
var completed_levels = []  # Список уровней, завершенных на 100%
var scene_load_status = 0
var scene_to_open
var loading_object
# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.connect("scene_change_requested", _on_scene_change_requested)
	EventBus.connect("add_succes", add_level)
	EventBus.connect("add_very_succes", complete_level)
	EventBus.connect("level_choice", _open_level)
	EventBus.connect("play_button_sound", play_button_sound)
	EventBus.connect("change_sound_first", change_mod)
	EventBus.connect("music_change", change_music)
	load_game()
	
	
func change_music():
	if Music.volume_db == -80:
		Music.volume_db = -10
		EventBus.music = true
	elif Music.volume_db == -10:
		Music.volume_db = -80
		EventBus.music = false
	else:
		Music.volume_db = -80
		EventBus.music = false
	
func change_mod():
	if global_sound_mod:
		global_sound_mod = false
		EventBus.sound = false
	else:
		global_sound_mod = true
		EventBus.sound = true
	EventBus.change_sound_second.emit(global_sound_mod)
	
func play_button_sound():
	if global_sound_mod:
		ButtonSound.play()
	
func add_level(level):

	if "Level_" + str(level) not in level_progress:
		level_progress.append("Level_" + str(level))
	save_game()
	
func complete_level(level):
	if "Level_" + str(level) not in completed_levels:
		completed_levels.append("Level_" + str(level))
		save_game()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scene_to_open != null:
		scene_load_status = ResourceLoader.load_threaded_get_status(scene_to_open, progress)
		if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
			var Canvas = CanvasLayer.new()
			if scene_to_open  == MainMenu or scene_to_open == LevelMenu:
				add_child(Canvas)
			var loader = ResourceLoader.load_threaded_get(scene_to_open)
			var new_scene = loader.instantiate()
			if scene_to_open  == MainMenu or scene_to_open == LevelMenu:
				Canvas.add_child(new_scene)
				print("Loading done!")
			else:
				add_child(new_scene)
			scene_to_open = null
			for i in get_children():
				if i is Loading:
					i.queue_free()
				else:
					for e in i.get_children():
						if e is Loading:
							e.queue_free()
					
					
func _on_scene_change_requested(scene_name):
	
	if scene_name == "MainMenu":
		scene_to_open = MainMenu
	elif scene_name == "LevelMenu":
		scene_to_open = LevelMenu
	elif scene_name == "MainScene":
		scene_to_open = MainScene
	get_child(1).queue_free()
	var loading = load(LoadScene)
	loading_object = loading.instantiate()
	add_child(loading_object)
	
	ResourceLoader.load_threaded_request(scene_to_open)
	
func _open_level(level_number):
	global_level_info = level_number
	_on_scene_change_requested("MainScene")
	
func save_game():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	if file:
		var data_to_save = {
			"level_progress": level_progress,
			"completed_levels": completed_levels
		}
		file.store_var(data_to_save)

func load_game():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		if file:
			var saved_data = file.get_var()
			if saved_data and typeof(saved_data) == TYPE_DICTIONARY:
				level_progress = saved_data.get("level_progress", [])
				completed_levels = saved_data.get("completed_levels", [])
			else:
				level_progress = []
				completed_levels = []
	else:
		level_progress = []
		completed_levels = []
		save_game()
