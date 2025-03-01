extends Node2D 
class_name Loading
@onready var Text = $CanvasLayer/CenterContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(get_parent().progress) != 0:
		Text.text = str(floor(get_parent().progress[0]*100)) + "%"
	pass
