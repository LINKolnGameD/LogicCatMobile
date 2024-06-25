extends Node2D

@onready var floor = $Floor
#position order follow this logic: the rightmost diagonal line from top to bottom, 4 parts ang go on the same to left direction
@onready var InteriorPositions = [$Cell1A.global_position, $Cell2A.global_position, $Cell3A.global_position, $Cell4A.global_position,
$Cell1B.global_position

]
var level_manager
var all_elem_in: bool


var random = RandomNumberGenerator.new()

func _ready():
	all_elem_in = false
	var floor_number = random.randi_range(0,1)
##
#func furniture_info(soft, lonely, collision_position, cat_in):
#	pass
func _process(delta):
	print(InteriorPositions)
#	EventBus.furniture_info(level_manager)


