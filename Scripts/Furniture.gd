extends Node2D
@export_enum("Sofa", "CoffeTable", "Box", "ArmChair", "ChairEars", "Bed", "BedEars", "Puff", "PuffEars", "Table", "Stand", "Shelf") var Type: int

@onready var collision = $FurnitureArea/CollisionShape2D

var cat_in : bool = false
var soft : bool
var lonely : bool
var collision_position

func _process(delta):
	collision_position = collision.position


func _on_area_2d_body_entered(body):
	if body == CharacterBody2D:
		if body.Type == "Cat":
			cat_in = true
			
func furniture_info():
	if Type == 0 or Type == 3 or Type == 4 or Type == 5 or Type == 6 or Type == 7 or Type == 8 or Type == 9:
		soft = true
	else:
		soft = false
		EventBus.furniture_info.emit(soft, lonely, collision_position, cat_in)

