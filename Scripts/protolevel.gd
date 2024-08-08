extends Node2D

@onready var floor = $Floor
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
	print(current_cells)
	print(current_furniture)
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
				
	for e in current_cells:
		if current_furniture[current_cells.find(e)].warmth:
			if current_cells.find(e - 1) == -1 and current_cells.find(e + 1) == -1 and current_cells.find(e - 4) == -1 and current_cells.find(e + 4) == -1:
				pass
			else:
				if current_cells.find(e - 1) != -1 and e != 5 and e != 9 and e != 13:
					current_furniture[current_cells.find(e - 1)].post_warmth = true
				if current_cells.find(e + 1) != -1 and e != 4 and e != 8 and e != 12:
					current_furniture[current_cells.find(e + 1)].post_warmth = true
				if current_cells.find(e - 4) != -1:
					current_furniture[current_cells.find(e - 4)].post_warmth = true
				if current_cells.find(e + 4) != -1:
					current_furniture[current_cells.find(e + 4)].post_warmth = true
				if current_cells.find(e - 5) != -1 and e != 9 and e != 13:
					current_furniture[current_cells.find(e - 5)].post_warmth = true
				if current_cells.find(e + 5) != -1 and e != 4 and e != 8:
					current_furniture[current_cells.find(e + 5)].post_warmth = true
				if current_cells.find(e - 3) != -1 and e != 4 and e != 8 and e != 12 and e != 16:
					current_furniture[current_cells.find(e - 3)].post_warmth = true
				if current_cells.find(e + 3) != -1 and e != 1 and e != 5 and e != 9 and e != 13:
					current_furniture[current_cells.find(e + 3)].post_warmth = true
				
	
	var floor_number = random.randi_range(0,2)
	if is_floor_set == false:
		if floor_number == 0:
			floor.clear_layer(1)
			floor.clear_layer(2)
		elif floor_number == 1:
			floor.clear_layer(0)
			floor.clear_layer(2)
		elif floor_number == 2:
			floor.clear_layer(1)
			floor.clear_layer(0)
		is_floor_set = true
	
	pass
#	EventBus.furniture_info(level_manager)
	
func spawn(furniture_name, furniture_position, flip_info):
	var furniture_spawn
	#fix this shit
	if furniture_name == "ArmChair":
		furniture_spawn = preload("res://Scenes/InteriorElements/arm_chair.tscn").instantiate()
	if furniture_name == "Shelf":
		furniture_spawn = preload("res://Scenes/InteriorElements/shelf.tscn").instantiate()
	if furniture_name == "Sofa":
		furniture_spawn = preload("res://Scenes/InteriorElements/sofa.tscn").instantiate()
	if furniture_name == "Sofa2":
		furniture_spawn = preload("res://Scenes/InteriorElements/sofa_left_side.tscn").instantiate()
	if furniture_name == "Table":
		furniture_spawn = preload("res://Scenes/InteriorElements/table.tscn").instantiate()
	if furniture_name == "Table2":
		furniture_spawn = preload("res://Scenes/InteriorElements/table_left_part.tscn").instantiate()
	if furniture_name == "CoffeeTable":
		furniture_spawn = preload("res://Scenes/InteriorElements/coffee_table.tscn").instantiate()
	if furniture_name == "Box":
		furniture_spawn = preload("res://Scenes/InteriorElements/box.tscn").instantiate()
	if furniture_name == "ChairEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/chair_ears.tscn").instantiate()
	if furniture_name == "Bed":
		furniture_spawn = preload("res://Scenes/InteriorElements/bed.tscn").instantiate()
	if furniture_name == "BedEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/bed_ears.tscn").instantiate()
	if furniture_name == "Puff":
		furniture_spawn = preload("res://Scenes/InteriorElements/puff.tscn").instantiate()
	if furniture_name == "PuffEars":
		furniture_spawn = preload("res://Scenes/InteriorElements/puff_ears.tscn").instantiate()
	if furniture_name == "Stand":
		furniture_spawn = preload("res://Scenes/InteriorElements/stand.tscn").instantiate()
	if furniture_name == "Lamp":
		furniture_spawn = preload("res://Scenes/InteriorElements/lamp.tscn").instantiate()
	if furniture_name == "Candle":
		furniture_spawn = preload("res://Scenes/InteriorElements/candle.tscn").instantiate()
	if furniture_name == "TV":
		furniture_spawn = preload("res://Scenes/InteriorElements/tv.tscn").instantiate()
	add_child(furniture_spawn)
	set_position_furniture(furniture_position)
	if furniture_name == "Sofa" and flip_info or furniture_name == "Table" and flip_info:
		furniture_spawn.position = Vector2(target_position.x, target_position.y + 87)
#		furniture_spawn.get_child(1).position = Vector2(- 150, -150)
		furniture_spawn.get_child(1).position = Vector2(40, -200)
	elif furniture_name == "Sofa2" and flip_info:
		furniture_spawn.position = Vector2(target_position.x - 5, target_position.y - 94)
#		furniture_spawn.get_child(1).position = Vector2(210, -100)
		furniture_spawn.get_child(1).position = Vector2(40, -20)
	elif furniture_name == "Table2" and flip_info:
		furniture_spawn.position = Vector2(target_position.x - 5, target_position.y - 92)
		furniture_spawn.get_child(1).position = Vector2(40, -20)
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
	current_furniture[current_cells.find(cell)].collision.disabled = true
	current_furniture[current_cells.find(cell)].cat_chidrens_array.append(cat_spawn)
	
		
func set_position_furniture(furniture_position):
	var cell_number: int
	target_position = InteriorPositions[furniture_position-1].position
	
	
#	

