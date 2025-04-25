class_name Cat extends CharacterBody2D

@export var speed:int = 300

@onready var collision = $CatAnSprite/AreaCat/CollisionShape2D
@onready var HappyMeow = $HappyMeow
@onready var AngryMeow = $AngryMeow
@onready var in_which_area = []
@onready var plug_array = []
@onready var AnimationC = $CatAnSprite
@onready var CardSound = $CardSound

var card: Control
var map: Node2D

var calculate_closest_area = []
var predictable_target
var satisfaction
var main_scene_way

#cat appearence
var appearence = []
var base_animation
var taken_animation

#moving state machine
const STAND = 1
const MOVE = 2
const TAKEN = 3

enum STATE {STAND, MOVE, TAKEN}
var current_state : STATE

#arrays common
var our_preferences = []
var parent_preferences = []
var streams_array = []

var cat_can_meow: bool = false
var can_be_picked: bool = true
var _mouse_enter: bool = false
var plug_set = false
var cat_numeration: int
var can_fall: bool = false
var our_sit_place

var target: Node

func _ready():
	var animations = []
	var random = RandomNumberGenerator.new()
	var AreaColl = get_node("CatAnSprite/AreaCat")
	AreaColl.area_entered.connect(_area_entered)
	AreaColl.area_exited.connect(_area_exited)
	AreaColl.mouse_entered.connect(_mouse_entered)
	AreaColl.mouse_exited.connect(_mouse_exited)
	EventBus.change_sound_second.connect(sound_change)
	var color = random.randi_range(1,3)
	if color == 1:
		appearence.append("red")
	if color == 2:
		appearence.append("gray")
	if color == 3:
		appearence.append("creme")
	appearence.append("strp")
	var tail = random.randi_range(1,3)
	appearence.append(tail)
	var age = random.randi_range(1,2)
	if age == 1:
		appearence.append("kitty")
	elif age == 2:
		appearence.append("cat")
	if AnimationC.sprite_frames == null:
		var needed_string = str("res://Scenes/Cats/", appearence[3],appearence[0],appearence[1],appearence[2],".tres")
		AnimationC.sprite_frames = load(needed_string)
		AnimationC.play("Tail")
		
	if get_parent().get_parent().get_parent().get_parent().get_parent().global_sound_mod == false:
		CardSound.volume_db = -80
		AngryMeow.volume_db = -80
		HappyMeow.volume_db = -80 

func _process(delta):
	print(current_state)
#	print(AnimationC.sprite_frames.get_animation_names(), appearence)

#	if $CatAnSprite.sprite_frames == null:
#		if appearence[0] == "Red":
#			if appearence[2] == 1:
#				$CatAnSprite.sprite_frames = load("res://Scenes/Cats/catredstrp1.tres")
#			elif appearence[2] == 2:
#				$CatAnSprite.sprite_frames = load("res://Scenes/Cats/catredstrp2.tres")
#		else:
#			$CatAnSprite.sprite_frames = load("res://Scenes/Cats/catredstrp2.tres")
		
	if get_parent().get_parent().name == "HBoxContainer":
		main_scene_way = card.MainScene
	elif get_parent().name == "FurnitureArea":
		main_scene_way = get_parent().get_parent().get_parent().MainScene
		our_sit_place = get_parent().get_parent()
		
	if plug_set == false:
		for i in main_scene_way.Level.get_children():
			if i is Plug:
				plug_array.append(i)
#	for i in main_scene_way.LevelInterior.current_furniture:
#		if i.Type == 5 or i.Type == 6:
#			AnimationC.sprite_frames.clear("Lying")
		plug_set = true
		
	if satisfaction != null:

		if cat_numeration == 1:
			main_scene_way.CatsSatisfaction.pop_at(0)
			main_scene_way.CatsSatisfaction.insert(0, satisfaction)
		elif cat_numeration == 2:
			main_scene_way.CatsSatisfaction.pop_at(1)
			main_scene_way.CatsSatisfaction.insert(1, satisfaction)
		elif cat_numeration == 3:
			main_scene_way.CatsSatisfaction.pop_at(2)
			main_scene_way.CatsSatisfaction.insert(2, satisfaction)
		elif cat_numeration == 4:
			main_scene_way.CatsSatisfaction.pop_at(3)
			main_scene_way.CatsSatisfaction.insert(3, satisfaction)
	
	#analytics of satisfaction
	if len(parent_preferences) != 0:
		if parent_preferences[0] != our_preferences[0] and our_preferences[0] != 2:
			satisfaction = 0
		elif  parent_preferences[1] != our_preferences[1] and our_preferences[1] != 2:
			satisfaction = 0
		elif parent_preferences[2] != our_preferences[2] and our_preferences[2] != 2:
			satisfaction = 0
		else:
			if parent_preferences[3] == 3:
				satisfaction = 100
			elif our_preferences[0] == 2 and our_preferences[1] == 2 and our_preferences[2] == 2 and parent_preferences[3] != 3:
				if main_scene_way.Level.current_furniture.any(for_blank_cats):
					satisfaction = 50
				else:
					satisfaction = 100
			else:
				var secondary_pref
				if our_preferences[0] == 2:
					if main_scene_way.Level.current_furniture.any(no_cat_good_and_comfy):
						satisfaction = 50
					else:
						satisfaction = 100
				else:
					if our_preferences[0] == 1:
						if main_scene_way.Level.current_furniture.any(for_social_cat):
							satisfaction = 50
						else:
#							if len(main_scene_way.Level.current_furniture.filter(free_place)) > 2:
#								satisfaction = 50
#							else:
								satisfaction = 100
					else:
						if main_scene_way.Level.current_furniture.any(for_lonely_cat):
							satisfaction = 50
						else:
							satisfaction = 100

	if current_state == 2 or get_parent() is Card:
		satisfaction = 0

	if cat_can_meow and current_state != 2:
		if satisfaction == 100:
			HappyMeow.play()
		elif satisfaction == 50 and current_state != 2:
			AngryMeow.play()
		elif satisfaction == 0 and current_state != 2 and get_parent().name == "FurnitureArea":
			AngryMeow.play()
		cat_can_meow = false

	
	if len(in_which_area) >= 2:
		for i in in_which_area:
			calculate_closest_area.pop_at(in_which_area.find(i))
			calculate_closest_area.insert(in_which_area.find(i),global_position.distance_to(i.global_position))
		predictable_target = in_which_area[calculate_closest_area.find(calculate_closest_area.min())]
	elif len(in_which_area) == 1:
		predictable_target = in_which_area[0]
	for i in in_which_area:
		global_position.distance_to(i.global_position)
		
	if target == null:
		target = card
		if predictable_target != null:
			target = predictable_target
	elif target != card:
		target = predictable_target

	_update_state(delta)

	if global_position.distance_to(target.global_position) < 10 and current_state == STATE.MOVE: 
		_set_state(STATE.STAND)
	
	move_and_slide()
	if not _mouse_enter: return

	if Input.is_action_pressed("click") and global_position.y - get_viewport().get_mouse_position().y < 200 and global_position.y - get_viewport().get_mouse_position().y > -200 and global_position.x - get_viewport().get_mouse_position().x < 200 and global_position.x - get_viewport().get_mouse_position().x > -200:
		if can_be_picked:
			_set_state(STATE.TAKEN)
	if Input.is_action_just_released("click") and current_state == 2:
		_set_state(STATE.MOVE)
		

func for_blank_cats(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if node.cat_chidrens_array[0].our_preferences[0] == 2 and node.cat_chidrens_array[0].our_preferences[1] == 2 and node.cat_chidrens_array[0].our_preferences[2] == 2:
				return false
			else:
				return true
		else:
			return true
	else:
		return false

func free_place(node):
	if len(node.cat_chidrens_array) == 0:
		if node.soft:
			if node.high and our_preferences[1] == 3 or node.high == false and our_preferences[1] == 1 or our_preferences[1] == 2:
				if node.warmth and our_preferences[2] == 3 or our_preferences[2] == 2:
					if main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 1 == 13 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 1 != 12 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 4) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 4).cat_chidrens_array) == 0 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 4) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 4).cat_chidrens_array) == 0 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 5 != 13 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 5 != 8 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] - 3 != 16 or main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3) != -1 and len(main_scene_way.Level.current_cells.find(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3).cat_chidrens_array) == 0 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] + 3 != 13:
						return true
					else:
						return false
				else:
					return false
			else:
				return false
		else:
			return false

func is_cell_occupied(cell_index: int, neighbors: Array, checking_place: int, node) -> bool:
	if our_preferences[0] == 3:
		if node.lonely == false:
			for plug in plug_array:
				if plug.neighbors.find(checking_place) != -1 and neighbors.find(checking_place) != -1:
					return true
				elif plug.neighbors.find(checking_place):
					return false
				else:
					continue
			return false
		else:
			return true
	else:
		if node.lonely:
					var node_neig = get_neighbors(checking_place)
					var soft_places_amount = []
					for neig in node_neig:
						if main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(neig)].soft:
							soft_places_amount.append(main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(neig)])
					if len(soft_places_amount) <= 1:
						return true #место не подходит
					else:
						if main_scene_way.card_amount > 1:
							for place in soft_places_amount:
								if check_preferences(place, our_preferences):
									return false
								else:
									continue
						else:
							return true
		else:
			return false
#	if cell_index < 0 or cell_index >= main_scene_way.Level.current_furniture.size():
#		return false
	
	var item = main_scene_way.Level.current_furniture[cell_index]
	if item == null:
		return false
	
	# Проверяем, занято ли место другим котом
	return item.cat_chidrens_array.size() > 0
	
#func get_available_cells() -> Array:
#	var available_cells = []
#	for i in range(main_scene_way.Level.current_furniture.size()):
#		if not is_cell_occupied(i):
#			available_cells.append(i)
#	return available_cells
# Функция для получения списка соседних клеток
func get_neighbors(cell_index: int) -> Array:
	var current_cells = main_scene_way.Level.current_cells
	var neighbors = []
	var part_neighbors = []

	var row_size = 4  # Размер строки в сетке (4 клетки на строку)
	# Координаты текущей клетки
	var x = cell_index % row_size
	var y = cell_index / row_size
	# Векторы для всех возможных соседей
	var neighbor_offsets = [
		Vector2(-1, -1), Vector2(0, -1), Vector2(1, -1),  # Верхний ряд
		Vector2(-1, 0),                   Vector2(1, 0),   # Средний ряд
		Vector2(-1, 1), Vector2(0, 1), Vector2(1, 1)    # Нижний ряд
	]
	for offset in neighbor_offsets:
		var neighbor_x = x + offset.x
		var neighbor_y = y + offset.y
		# Проверка, что соседняя клетка находится в пределах допустимых значений
		if neighbor_x >= 0 and neighbor_x < row_size and neighbor_y >= 0 and neighbor_y < row_size:
			var neighbor_index = neighbor_y * row_size + neighbor_x
			part_neighbors.append(neighbor_index)
	for i in part_neighbors:
		if current_cells.has(int(i)):
			neighbors.append(int(i))
	return neighbors
	
func is_place_occupied_by_plug(furniture_item) -> bool:
	if furniture_item == null:
		return false
	return furniture_item.has_node("Plug")  # Проверяем, есть ли дочерний узел Plug
	
# Проверка соседей для котика-одиночки, учитывая заглушки
func check_neighbors_for_lonely(node, neighbors: Array, cell_index) -> bool:
#	for neighbor_index in neighbors:
#		if neighbor_index < 0 or neighbor_index >= main_scene_way.Level.current_furniture.size():
#			continue  # Пропускаем индексы, которые вне диапазона
#
#		var neighbor = main_scene_way.Level.current_furniture[neighbor_index]
#		if neighbor != null and is_place_occupied_by_plug(neighbor):  # Если сосед заняты заглушкой
#			return false  # Одиночный котик недоволен, так как рядом заглушка
#	return true  # Одиночный котик удовлетворен

#	for neighbor in neighbors:
			
#		if main_scene_way.Level.get_children[main_scene_way.Level.get_children.find(Plug)].neighbors.find(cell_index) != -1:
	return false
	
func check_neighbors(node, neighbors: Array) -> bool:
	for neighbor_index in neighbors:
		var neighbor = main_scene_way.Level.current_furniture[neighbor_index]
		if node.lonely and neighbor != null:
			return false  # Котик одиночка, но рядом есть другой котик
		elif not node.lonely and neighbor == null:
			return false  # Котик социальный, но рядом никого нет
	return true

# Проверка соседей для социального котика, учитывая заглушки
func check_neighbors_for_social(node, neighbors: Array) -> bool:
	for neighbor_index in neighbors:
		if neighbor_index < 0 or neighbor_index >= main_scene_way.Level.current_furniture.size():
			continue  # Пропускаем индексы, которые вне диапазона

		var neighbor = main_scene_way.Level.current_furniture[neighbor_index]
		if neighbor != null and (neighbor != node or is_place_occupied_by_plug(neighbor)):
			return true  # Нашли соседа или заглушку, социальный котик удовлетворен
	return false  # Социальному котику никто не соседствует

	
# Функция для проверки соответствия предпочтений котика
func check_preferences(node, preferences: Array) -> bool:
	if node.high and preferences[1] == 3 or node.high == false and preferences[1] == 1 or preferences[1] == 2:
		if (node.warmth and preferences[2] == 3) or preferences[2] == 2 or (node.post_warmth and preferences[2] == 3):
			return true
	return false

# Функция для проверки комфорта места
func is_comfortable_place(node, preferences: Array) -> bool:
	if node.soft == false:
		return false  # Место не комфортное
	return check_preferences(node, preferences)
	
func for_lonely_cat(node) -> bool:
	var cell_index = main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(get_parent().get_parent())]
	var neighbors = get_neighbors(cell_index)
	var checking_place = main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]

	if node.cat_chidrens_array.size() != 0:
		return false# Место уже занято
		
	if node.soft == false:
		return false

	if is_cell_occupied(cell_index, neighbors, checking_place, node):
		return false  # Место не подходит под одинокого котика
#
#	if is_neighbor_cell(cell_index, neighbors):
#		return true
#
	if neighbor_occuped_by_plug(neighbors, cell_index, checking_place, node):
		return false
		
	# Проверка соседей для одиночного котика
#	if not check_neighbors_for_lonely(node, neighbors, cell_index):
#		return true

	# Проверка предпочтений
	if not check_preferences(node, our_preferences):
		return true

	return true  # Котик недоволен, ему место подходит, а он черт знает где
#
#func is_neighbour_cell():
#
	
func neighbor_occuped_by_plug(neighbors, cell_index, checking_place, node):
	if node.lonely == false:
		for plug in plug_array:
			if plug.neighbors.has(checking_place):
				return true
	return false
		
func for_social_cat(node) -> bool:
	var cell_index = main_scene_way.Level.current_cells.find(get_parent().get_parent())
	var neighbors = get_neighbors(cell_index)
	var checking_place = main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]

	if node.cat_chidrens_array.size() != 0:
		return false# Место уже занято
		
	if node.soft == false:
		return false

	if is_cell_occupied(cell_index, neighbors, checking_place, node):
		return false #место не подходит

	# Проверка соседей для социального котика
#	if not check_neighbors_for_social(node, neighbors):
#		return false

	# Проверка предпочтений
	if not check_preferences(node, our_preferences):
		return false

	return true  # Котик недоволен, место выбрано правильно

func free_okay_place(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 16 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13:
				if node.lonely == true:
					if our_preferences[1] == 3:
						return true
					else:
						return false
				else:
					if our_preferences[1] == 3:
						return false
					else:
						return true
						
func any_cells_left(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			if main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-1) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 3 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-4) or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+5) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]-3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 4 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 8 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 12 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 16 or main_scene_way.Level.current_cells.has(main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)]+3) and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 1 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 5 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 9 and main_scene_way.Level.current_cells[main_scene_way.Level.current_furniture.find(node)] != 13:
				return node
		
		
func no_cat_good_and_comfy(node):
	if node.soft:
		if len(node.cat_chidrens_array) > 0:
			return false
		else:
			if our_preferences[1] == 3 and node.high or our_preferences[1] == 1 and node.high == false or our_preferences[2] == 3 and node.warmth or our_preferences[2] == 1 and node.warmth == false or our_preferences[2] == 3 and node.post_warmth or our_preferences[2] == 1 and node.post_warmth == false:
				return true
			else:
				return false
	else:
		return false
	

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			reparent(target)
			cat_can_meow = true
			
		STATE.MOVE: # Enter WALK state logic
			reparent(card)
			
		STATE.TAKEN: # Enter JUMP state logic
			reparent(card)
			if card.global_position == global_position:
				CardSound.play(0.2)

@warning_ignore("unused_parameter")

func _update_state(delta: float) -> void:
	match current_state:
		STATE.STAND:
			position =  Vector2(0, target.position.y)
			if AnimationC.animation != "Tail" or AnimationC.animation != "Lying":
				if get_parent().get_parent().get_children().any(flipped):
					AnimationC.flip_h = true
				else:
					AnimationC.flip_h = false
				if get_parent().get_parent() is Furniture:
					if get_parent().get_parent().Type == 5:
						AnimationC.scale = Vector2(0.8,0.8)
						AnimationC.position = Vector2(-15,-80)
						if AnimationC.animation != "Lying":
							AnimationC.play("Lying")
					else:
						if appearence.has("kitty"):
							AnimationC.scale = Vector2(1.13,1.13)
						else:
							AnimationC.scale = Vector2(1.188,1.188)
						AnimationC.position = Vector2(31.429,-81.429)
						if AnimationC.animation != "Tail":
							AnimationC.play("Tail")
				else:
					if appearence.has("kitty"):
							AnimationC.scale = Vector2(1.13,1.13)
					else:
							AnimationC.scale = Vector2(1.188,1.188)
					AnimationC.position = Vector2(31.429,-81.429)
					if AnimationC.animation != "Tail":
						AnimationC.play("Tail")
			
		STATE.MOVE: 
			global_position = target.global_position
#			if AnimationC.animation != "Tail":
#				AnimationC.play("Tail")
			
		STATE.TAKEN: 
			global_position = get_viewport().get_mouse_position()
			if AnimationC.animation != "Taken":
				AnimationC.play("Taken")
			

func flipped(object):
	if object is Sprite2D or object is AnimatedSprite2D:
		if object.flip_h:
			return true
		else:
			return false
	else:
		return false
		
func _exit_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			pass
			
		STATE.MOVE: # Enter WALK state logic
			pass
			
		STATE.TAKEN: # Enter JUMP state logic
			pass

func _area_entered(node):
	if node.name != "FurnitureArea" or current_state != STATE.TAKEN: return
	in_which_area.append(node)
	target = predictable_target
#	hit_with_object()

func _area_exited(node):
#	hit_with_object()
	in_which_area.erase(node)
	calculate_closest_area.pop_at(in_which_area.find(node))
	if target == node:
		target = card

func _mouse_exited():
	_mouse_enter = false

func _mouse_entered():
	_mouse_enter = true
	
func sound_change(mod):
	if mod:
		HappyMeow.volume_db = 10
		AngryMeow.volume_db = 5
		CardSound.volume_db = 5
	else:
		HappyMeow.volume_db = -80
		AngryMeow.volume_db = -80
		CardSound.volume_db = -80



func _on_area_cat_input_event(viewport, event, shape_idx):
	if event == InputEventMouseMotion:
		can_fall = true
	else:
		can_fall = false
