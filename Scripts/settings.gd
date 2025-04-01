extends Control
@onready var Close_Button = $Close_Button
var mouse_in: bool = false
var mouse_in2: bool = false
var mouse_in3: bool = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_music_button_pressed():
	EventBus.music_change.emit()
	print("button presed")


func _on_sound_button_pressed():
	EventBus.emit_signal("change_sound_first")
	print("button presed")

func _on_center_container_mouse_entered():
	mouse_in = true


func _on_center_container_mouse_exited():
	mouse_in = false


func _on_sound_button_mouse_entered():
	mouse_in2 = true


func _on_sound_button_mouse_exited():
	mouse_in2 = false


func _on_music_button_mouse_entered():
	mouse_in3 = true


func _on_music_button_mouse_exited():
	mouse_in3 = false


func _on_play_pressed():
	queue_free()
