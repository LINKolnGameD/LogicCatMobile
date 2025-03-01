extends Control

@onready var SoundBar = $CenterContainer/Control/Sounds/HScrollBar
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_button_pressed():
	queue_free()


func _on_music_button_pressed():
	EventBus.music_change.emit()


func _on_sound_button_pressed():
	EventBus.emit_signal("change_sound_first")
