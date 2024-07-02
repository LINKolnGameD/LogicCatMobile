extends CharacterBody2D

@export var speed:int = 300

@onready var collision = $CatAnSprite/Area2D/CollisionShape2D

var card: Control
var map: Node2D

const STAND = 1
const MOVE = 2
const TAKEN = 3

enum STATE {STAND, MOVE, TAKEN}
var current_state : STATE

var _mouse_enter: bool = false

var target: Node

func _ready():
	var AreaColl = get_node("CatAnSprite/Area2D")
	AreaColl.area_entered.connect(_area_entered)
	AreaColl.area_exited.connect(_area_exited)
	AreaColl.mouse_entered.connect(_mouse_enterend)
	AreaColl.mouse_exited.connect(_mouse_exited)
	


func _process(delta):
	if target == null:
		target = card
	
	if target != card:
		collision.debug_color = Color(255, 0, 0, 0.15)
	else:
		collision.debug_color = Color(0, 0, 255, 0.15)
		
	_update_state(delta)

		
	
	
	if global_position.distance_to(target.global_position) < 10 and current_state == STATE.MOVE: 
		_set_state(STATE.STAND)
	
	move_and_slide()
	
	if not _mouse_enter: return
	
	if Input.is_action_pressed("click") :
		_set_state(STATE.TAKEN)
	elif Input.is_action_just_released("click"):
		_set_state(STATE.MOVE)
	
#	print(get_parent())
		
	

func _set_state(new_state: STATE) -> void:
	if current_state == new_state:
		return
	
	_exit_state()
	current_state = new_state
	_enter_state()

func _enter_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			reparent(target)
			
		STATE.MOVE: # Enter WALK state logic
			reparent(card)
			
		STATE.TAKEN: # Enter JUMP state logic
			reparent(card)

func _update_state(delta: float) -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			position =  target.position
			
		STATE.MOVE: # Enter WALK state logic
			global_position = target.global_position
			
		STATE.TAKEN: # Enter JUMP state logic
			global_position = get_viewport().get_mouse_position()

func _exit_state() -> void:
	match current_state:
		STATE.STAND: # Enter IDLE state logic
			pass
			
		STATE.MOVE: # Enter WALK state logic
			pass
			
		STATE.TAKEN: # Enter JUMP state logic
			pass

func _area_entered(node):
	if node.name != "FurnitureArea" or current_state != STATE.TAKEN: return
	target = node

func _area_exited(node):
	if target == node:
		target = card

func _mouse_exited():
	_mouse_enter = false

func _mouse_enterend():
	_mouse_enter = true
	
