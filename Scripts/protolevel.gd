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
	#for every object, if current cells[find(
	for e in current_cells:
		if current_cells.find(e - 1) == -1 and current_cells.find(e + 1) == -1 and current_cells.find(e - 4) == -1 and current_cells.find(e + 4) == -1 and current_cells.find(e + 3) == -1 and current_cells.find(e - 3) == -1 and current_cells.find(e + 5) == -1 and current_cells.find(e - 5) == -1:
			current_furniture[current_cells.find(e)].lonely = true
		else:
			if current_cells.find(e - 1) != -1 and e != 5 and e != 9 and e != 13:
				if len(current_furniture[current_cells.find(e-1)].cat_chidrens_array) >= 1 and e != 5 and e != 9 and e != 13:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif  current_cells.find(e + 1) != -1 and e != 4 and e != 8 and e != 12:
				if len(current_furniture[current_cells.find(e+1)].cat_chidrens_array) >= 1 and e != 4 and e != 8 and e != 12:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif  current_cells.find(e - 4) != -1:
				if len(current_furniture[current_cells.find(e-4)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif  current_cells.find(e + 4) != -1:
				if len(current_furniture[current_cells.find(e+4)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif current_cells.find(e - 5) != -1 and e != 9 and e != 13:
				if len(current_furniture[current_cells.find(e-5)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif current_cells.find(e + 5) != -1 and e != 4 and e != 8:
				if len(current_furniture[current_cells.find(e+5)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif current_cells.find(e - 3) != -1 and e != 4 and e != 8 and e != 12 and e != 16:
				if len(current_furniture[current_cells.find(e-3)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			elif current_cells.find(e + 3) != -1 and e != 1 and e != 5 and e != 9 and e != 13:
				if len(current_furniture[current_cells.find(e+3)].cat_chidrens_array) >= 1:
					current_furniture[current_cells.find(e)].lonely = false
				else:
					current_furniture[current_cells.find(e)].lonely = true
			else:
				current_furniture[current_cells.find(e)].lonely = true
				
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
	if furniture_name == "Table":
		furniture_spawn = preload("res://Scenes/InteriorElements/table.tscn").instantiate()
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
	furniture_spawn.position = target_position
	current_cells.append(furniture_position)
	current_furniture.append(furniture_spawn)
	if flip_info == true:
		furniture_spawn.get_child(0).flip_h = true
		
func set_position_furniture(furniture_position):
	var cell_number: int
	target_position = InteriorPositions[furniture_position-1].position
	
	
#	

