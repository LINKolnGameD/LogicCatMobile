extends Node2D
class_name Plug

@onready var main_scene_way = get_parent().get_parent()
var is_occupied = true  # Флаг, указывающий, что место занято
var our_cell
var part_neighbors = []
var neighbors = []
@onready var our_furniture =  main_scene_way.Level.current_furniture[main_scene_way.Level.current_cells.find(our_cell)]
var cell_set: bool = false
var neighbours_set: bool = false
var current_cells
# Called when the node enters the scene tree for the first time.
func _ready():
	current_cells = main_scene_way.Level.current_cells


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cell_set == false:
		if our_cell != null:
			var cell_index = our_cell
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
					
		cell_set = true
	else:
		if neighbours_set == false:
			
			for i in part_neighbors:
				
				if current_cells.has(int(i)):
					neighbors.append(int(i))
				else:
					print("ne podhodit")
			neighbours_set = true
