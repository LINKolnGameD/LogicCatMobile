extends Node2D

@onready var floorw = $White_Floor
@onready var floorc = $Carpet_Floor
@onready var flooro = $Oak_Floor
#position order follow this logic: the rightmost diagonal line from top to bottom, 4 parts ang go on the same to left direction
@onready var InteriorPositions = [$Cell1A, $Cell2A, $Cell3A, $Cell4A,
$Cell1B, $Cell2B, $Cell3B, $Cell4B,
$Cell1C, $Cell2C, $Cell3C, $Cell4C,
$Cell1D, $Cell2D, $Cell3D, $Cell4D,
]
@onready var MainScene = $".."

var target_position
var level_manager
var current_furniture = []
var current_cells = []
#flags
var all_elem_in: bool
var is_floor_set: bool = false

var random = RandomNumberGenerator.new()

func _ready():
	all_elem_in = false
##
#func furniture_info(soft, lonely, collision_position, cat_in):
#	pass
func _process(delta):
	#for every object, if current cells[find(
	for e in current_cells:
		MainScene.fcat_places.clear()
		current_furniture[current_cells.find(e)].lonely = true
#		if current_cells.find(e - 1) == -1 and current_cells.find(e + 1) == -1 and current_cells.find(e - 4) == -1 and current_cells.find(e + 4) == -1 and current_cells.find(e + 3) == -1 and current_cells.find(e - 3) == -1 and current_cells.find(e + 5) == -1 and current_cells.find(e - 5) == -1:
#			current_furniture[current_cells.find(e)].lonely = true
#		else:
		if current_cells.find(e - 1) != -1 and e != 5 and e != 9 and e != 13:
				if len(current_furniture[current_cells.find(e-1)].cat_chidrens_array) >= 1 and e != 5 and e != 9 and e != 13:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e + 1) != -1 and e != 4 and e != 8 and e != 12:
				if len(current_furniture[current_cells.find(e+1)].cat_chidrens_array) >= 1 and e != 4 and e != 8 and e != 12:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e - 4) != -1:
				if len(current_furniture[current_cells.find(e-4)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e + 4) != -1:
				if len(current_furniture[current_cells.find(e+4)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e - 5) != -1 :
				if len(current_furniture[current_cells.find(e-5)].cat_chidrens_array) >= 1 and e != 9 and e != 13:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e + 5) != -1 :
				if len(current_furniture[current_cells.find(e+5)].cat_chidrens_array) >= 1 and e != 4 and e != 8:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e - 3) != -1:
				if len(current_furniture[current_cells.find(e-3)].cat_chidrens_array) >= 1 and e != 4 and e != 8 and e != 12 and e != 16:
					current_furniture[current_cells.find(e)].lonely = false
		if current_cells.find(e + 3) != -1:
				if len(current_furniture[current_cells.find(e+3)].cat_chidrens_array) >= 1 and e != 1 and e != 5 and e != 9 and e != 13:
					current_furniture[current_cells.find(e)].lonely = false
				
	var tested = []
	for i in range(current_furniture.size()):
		var item = current_furniture[i]

		if item.warmth:
			#если в клетках есть клетка больше/меньше и эта клетка не равняется вот этим, то предмет на этой клетке больше/меньше
			if current_cells.find(current_cells[i]-1) != -1 and current_cells[i] != 5 and current_cells[i] != 9 and current_cells[i] != 13 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]-1)].post_warmth = true
			if  current_cells.find(current_cells[i]+1) != -1 and current_cells[i]!= 4 and current_cells[i]!= 8 and current_cells[i]!= 12 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]+1)].post_warmth = true
			if  current_cells.find(current_cells[i]-4)!= -1 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]-4)].post_warmth = true
			if  current_cells.find(current_cells[i]+4)!= -1 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]+4)].post_warmth = true
			if  current_cells.find(current_cells[i]-5)!= -1 and current_cells[i]!= 9 and current_cells[i]!= 13 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]-5)].post_warmth = true
			if  current_cells.find(current_cells[i]+5)!= -1 and current_cells[i]!= 4 and current_cells[i]!= 8 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]+5)].post_warmth = true
			if  current_cells.find(current_cells[i]-3)!= -1 and current_cells[i]!= 4 and current_cells[i]!= 8 and current_cells[i]!= 12 and current_cells[i]!= 16 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]-3)].post_warmth = true
			if current_cells.find(current_cells[i]+3)!= -1 and current_cells[i]!= 1 and current_cells[i]!= 5 and current_cells[i]!= 9 and current_cells[i]!= 13 and item.Type != 5 and item.Type != 6:
				current_furniture[current_cells.find(current_cells[i]+3)].post_warmth = true
			
		
#		if current_cells.find(e)+1 != len(current_furniture) and current_furniture[current_cells.find(e)+1].warmth:
#				if current_cells.find(e - 1) != -1 and e != 5 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 1)].post_warmth = true
#				if current_cells.find(e + 1) != -1 and e != 4 and e != 8 and e != 12 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 1)].post_warmth = true
#				if current_cells.find(e - 4) != -1 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 4)].post_warmth = true
#				if current_cells.find(e + 4) != -1 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 4)].post_warmth = true
#				if current_cells.find(e - 5) != -1 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 5)].post_warmth = true
#				if current_cells.find(e + 5) != -1 and e != 4 and e != 8 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 5)].post_warmth = true
#				if current_cells.find(e - 3) != -1 and e != 4 and e != 8 and e != 12 and e != 16 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 3)].post_warmth = true
#				if current_cells.find(e + 3) != -1 and e != 1 and e != 5 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 3)].post_warmth = true
#		elif  current_furniture[current_cells.find(e)].warmth:
#				if current_cells.find(e - 1) != -1 and e != 5 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 1)].post_warmth = true
#				if current_cells.find(e + 1) != -1 and e != 4 and e != 8 and e != 12 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 1)].post_warmth = true
#				if current_cells.find(e - 4) != -1 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 4)].post_warmth = true
#				if current_cells.find(e + 4) != -1 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 4)].post_warmth = true
#				if current_cells.find(e - 5) != -1 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 5)].post_warmth = true
#				if current_cells.find(e + 5) != -1 and e != 4 and e != 8 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 5)].post_warmth = true
#				if current_cells.find(e - 3) != -1 and e != 4 and e != 8 and e != 12 and e != 16 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e - 3)].post_warmth = true
#				if current_cells.find(e + 3) != -1 and e != 1 and e != 5 and e != 9 and e != 13 and current_furniture[current_cells.find(e - 1)].Type != 5 and current_furniture[current_cells.find(e - 1)].Type != 6:
#					current_furniture[current_cells.find(e + 3)].post_warmth = true
#		tested.append(e)
#		if len(tested) == len(current_furniture):
#			tested.clear()
	
	var floor_number = random.randi_range(0,2)
	if is_floor_set == false:
		if floor_number == 0:
			floorc.queue_free()
			flooro.queue_free()
		elif floor_number == 1:
			floorw.queue_free()
			flooro.queue_free()
		elif floor_number == 2:
			floorw.queue_free()
			floorc.queue_free()
		is_floor_set = true
	
	pass
#	EventBus.furniture_info(level_manager)
	
func spawn(furniture_name, furniture_position, flip_info):
	var furniture_spawn
	#fix this shit
	if furniture_name == "ArmChair":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/arm_chair.tscn").instantiate()
	if furniture_name == "Shelf":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/shelf.tscn").instantiate()
	if furniture_name == "Sofa":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/sofa.tscn").instantiate()
	if furniture_name == "Sofa2":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/sofa_left_side.tscn").instantiate()
	if furniture_name == "Table":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/table.tscn").instantiate()
	if furniture_name == "Table2":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/table_left_side.tscn").instantiate()
	if furniture_name == "CoffeeTable":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/coffee_table.tscn").instantiate()
	if furniture_name == "Box":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/box.tscn").instantiate()
	if furniture_name == "ChairEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/chair_ears.tscn").instantiate()
	if furniture_name == "Bed":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/bed.tscn").instantiate() 
	if furniture_name == "BedEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/bed_ears.tscn").instantiate()
	if furniture_name == "Puff":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/puff.tscn").instantiate()
	if furniture_name == "PuffEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/puff_ears.tscn").instantiate()
	if furniture_name == "Stand":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/stand.tscn").instantiate()
	if furniture_name == "Lamp":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/lamp.tscn").instantiate()
	if furniture_name == "Candle":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/candle.tscn").instantiate()
	if furniture_name == "TV":
		furniture_spawn = preload("res://Scenes/InteriorElements/NewSceneInt/tv.tscn").instantiate()
	add_child(furniture_spawn)
	set_position_furniture(furniture_position)
	if furniture_name == "Sofa" and flip_info:
		furniture_spawn.position = Vector2(target_position.x, target_position.y + 87)
#		furniture_spawn.get_child(1).position = Vector2(- 150, -150)
#		furniture_spawn.get_child(0).position = Vector2(40, -100)
		furniture_spawn.get_child(1).position = Vector2(40, -200)
	elif furniture_name == "Sofa2" and flip_info:
		furniture_spawn.position = Vector2(target_position.x - 5, target_position.y - 94)
#		furniture_spawn.get_child(1).position = Vector2(210, -100)
#		furniture_spawn.get_child(0).position = Vector2(40, -20)
		furniture_spawn.get_child(1).position = Vector2(40, -20)
	elif furniture_name == "Table2" and flip_info:
		furniture_spawn.position = Vector2(target_position.x - 5, target_position.y - 90)
		furniture_spawn.get_child(1).position = Vector2(-10, -100)
	elif  furniture_name == "Table" and flip_info:
		furniture_spawn.position = Vector2(target_position.x, target_position.y + 87)
		furniture_spawn.get_child(1).position = Vector2(50, -300)
	elif furniture_name == "ChairEars" and flip_info:
		furniture_spawn.position = Vector2(target_position.x - 180, target_position.y)
		furniture_spawn.get_child(1).position.x += 210
		furniture_spawn.get_child(2).flip_h = true
	elif furniture_name == "Candle":
		if current_cells.has(furniture_position):
			furniture_spawn.position = Vector2(target_position.x, target_position.y - 100)
			current_furniture[current_cells.find(furniture_position)].collision.disabled = true
		else:
			furniture_spawn.position = Vector2(target_position.x, target_position.y)
	elif furniture_name == "Lamp":
		if current_cells.has(furniture_position):
			furniture_spawn.position = Vector2(target_position.x, target_position.y - 100)
			current_furniture[current_cells.find(furniture_position)].collision.disabled = true
		else:
			furniture_spawn.position = Vector2(target_position.x, target_position.y)
	elif furniture_name == "TV" and flip_info:
		furniture_spawn.get_child(1).flip_h = true
		furniture_spawn.position = Vector2(target_position.x, target_position.y)
	elif furniture_name == "Bed" and flip_info or furniture_name == "BedEars" and flip_info:
		furniture_spawn.get_child(0).flip_h = true
		furniture_spawn.get_child(2).flip_h = true
		furniture_spawn.position = Vector2(target_position.x, target_position.y)
		furniture_spawn.get_child(1).position.x += 100
	else:
		furniture_spawn.position = target_position
	current_cells.append(furniture_position)
	current_furniture.append(furniture_spawn)
	if flip_info:
		furniture_spawn.get_child(0).flip_h = true
		
func spawn_plug(cell):
	var cat_spawn 
	cat_spawn = preload("res://Scenes/plug.tscn").instantiate()
	add_child(cat_spawn)
	cat_spawn.global_position = current_furniture[current_cells.find(cell)].area.global_position
	cat_spawn.our_cell = cell
	current_furniture[current_cells.find(cell)].collision.disabled = true
	current_furniture[current_cells.find(cell)].cat_chidrens_array.append(cat_spawn)
	
		
func set_position_furniture(furniture_position):
	var cell_number: int
	target_position = InteriorPositions[furniture_position-1].position
	
	
#	

