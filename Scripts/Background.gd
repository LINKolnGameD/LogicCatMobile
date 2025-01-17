extends Node2D
@onready var Pattern = $Pattern
var random = RandomNumberGenerator.new()
var blue_background_color = "c9d4e3"
var violet_background_color = "c0a8ca"
var orange_background_color = "fc993f"

# Called when the node enters the scene tree for the first time.
func _ready():
	var pattern_number = random.randi_range(1,4)
	if pattern_number == 1:
		Pattern.texture = load("res://Assets/GUI Elements/клубок ниток с фоном (3).png")
		RenderingServer.set_default_clear_color(Color(blue_background_color))
		Pattern.scale = Vector2(0.06, 0.06)
		Pattern.modulate = Color(1,1,1,0.2)
	elif pattern_number == 2:
		Pattern.texture = load("res://Assets/GUI Elements/1 (5).png")
		Pattern.scale = Vector2(0.5, 0.5)
		Pattern.modulate = Color(1,1,1,1)
	elif pattern_number == 3:
		Pattern.texture = load("res://Assets/GUI Elements/1 (6).png")
		Pattern.scale = Vector2(0.5, 0.5)
		Pattern.modulate = Color(1,1,1,0.3)
		RenderingServer.set_default_clear_color(Color(orange_background_color))
	elif pattern_number == 4:
		Pattern.texture = load("res://Assets/GUI Elements/1 (7).png")
		RenderingServer.set_default_clear_color(Color(violet_background_color))
		Pattern.scale = Vector2(0.5, 0.5)
		Pattern.modulate = Color(1,1,1,0.8)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
