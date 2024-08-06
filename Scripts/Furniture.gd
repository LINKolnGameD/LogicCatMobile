extends Node2D
class_name Furniture
@export_enum("Sofa", "CoffeTable", "Box", "ArmChair", "ChairEars", "Bed", "BedEars", "Puff", "PuffEars", "Table", "Stand", "Shelf", "Candle", "Lamp", "TV") var Type: int

@onready var collision = $FurnitureArea/CollisionShape2D
@onready var area = $FurnitureArea


var cat_in : bool = false
var soft : bool
var lonely : bool = true
var high : bool
var warmth : bool
var post_warmth: bool
var current_things
var cat_chidrens_array = []

func _ready():
	pass

func _process(delta):
	print(lonely, name)
	if len(cat_chidrens_array) > 0:
		for i in cat_chidrens_array:
			if i is Cat:
				cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.clear()
				if lonely:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(0, 3)
				else:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(0, 1)
				if high:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(1, 3)
				else:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(1, 1)
				if warmth or post_warmth:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(2, 3)
				else:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(2, 1)
				if soft:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(3, 3)
				else:
					cat_chidrens_array[cat_chidrens_array.find(i)].parent_preferences.insert(3, 1)
				
		
	if name != "Furniture":
		pass
	current_things = $FurnitureArea.get_overlapping_bodies() 

	if current_things.size() > 1:
		if cat_chidrens_array.size() > 1:
			for i in current_things:
				if i.current_state == 0 and i.current_state != 2:
					i.current_state = 1
			return
		
	if Type == 0 or Type == 1 or Type == 9 or Type == 11 or Type == 14:
		high = true
	else:
		high = false
		
	if Type == 0 or Type == 3 or Type == 4 or Type == 5 or Type == 6 or Type == 7 or Type == 8 or Type == 14:
		soft = true
	else:
		soft = false
		EventBus.furniture_info.emit(cat_in)
	if Type == 13 or Type == 14 or Type == 15:
		warmth = true
	else:
		warmth = false
	
#			$FurnitureArea/CollisionShape2D.disabled = true
#		else:
#			$FurnitureArea/CollisionShape2D.disabled = false
		
func _on_area_2d_body_entered(body):
	if body is Cat:
		pass

func _on_furniture_area_body_exited(body):
	if body is Cat:
		pass



func _on_furniture_area_child_entered_tree(node):
	if node is Cat:
		cat_chidrens_array.append(node)


func _on_furniture_area_child_exiting_tree(node):
	if node is Cat:
		cat_chidrens_array.pop_front()
