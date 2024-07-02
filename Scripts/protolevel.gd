extends Node2D

@onready var floor = $Floor
#position order follow this logic: the rightmost diagonal line from top to bottom, 4 parts ang go on the same to left direction
@onready var InteriorPositions = [$Cell1A.position, $Cell2A.position, $Cell3A.position, $Cell4A.position,
$Cell1B.position, $Cell2B.position, $Cell3B.position, $Cell4B.position,
$Cell1C.position, $Cell2C.position, $Cell3C.position, $Cell4C.position,
$Cell1D.position, $Cell2D.position, $Cell3D.position, $Cell4D.position,
]
var level_manager
var all_elem_in: bool
var target_position

var random = RandomNumberGenerator.new()

func _ready():
	all_elem_in = false
	var floor_number = random.randi_range(0,1)
##
#func furniture_info(soft, lonely, collision_position, cat_in):
#	pass
func _process(delta):
	pass
#	EventBus.furniture_info(level_manager)
	
func spawn(furniture_name, furniture_position, flip_info):
	var furniture_spawn
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
	if flip_info == true:
		furniture_spawn.flip_h = true
		
func set_position_furniture(furniture_position):
	if furniture_position == "Cell1":
		target_position = InteriorPositions[0]
	if furniture_position == "Cell2":
		target_position = InteriorPositions[1]
	if furniture_position == "Cell3":
		target_position = InteriorPositions[2]
	if furniture_position == "Cell4":
		target_position = InteriorPositions[3]
	if furniture_position == "Cell5":
		target_position = InteriorPositions[4]
	if furniture_position == "Cell6":
		target_position = InteriorPositions[5]
	if furniture_position == "Cell7":
		target_position = InteriorPositions[6]
	if furniture_position == "Cell8":
		target_position = InteriorPositions[7]
	if furniture_position == "Cell9":
		target_position = InteriorPositions[8]
	if furniture_position == "Cell10":
		target_position = InteriorPositions[9]
	if furniture_position == "Cell11":
		target_position = InteriorPositions[10]
	if furniture_position == "Cell12":
		target_position = InteriorPositions[11]
	if furniture_position == "Cell13":
		target_position = InteriorPositions[12]
	if furniture_position == "Cell14":
		target_position = InteriorPositions[13]
	if furniture_position == "Cell15":
		target_position = InteriorPositions[14]
	if furniture_position == "Cell16":
		target_position = InteriorPositions[15]
		
	


