extends Control
@onready var Close_Button = $Close_Button
@onready var SoundButton = $CenterContainer/Control/CenterContainer/MarginContainer/VBoxContainer/SoundButton
@onready var MusicButton = $CenterContainer/Control/CenterContainer/MarginContainer/VBoxContainer/MusicButton
@onready var BlankSound = $CenterContainer/Control/CenterContainer/MarginContainer/VBoxContainer/BlankSound
@onready var BlankMusic = $CenterContainer/Control/CenterContainer/MarginContainer/VBoxContainer/BlankMusic
var mouse_in: bool = false
var mouse_in2: bool = false
var mouse_in3: bool = false
var sound_info: bool 
var music_info: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	sound_info = EventBus.sound
	music_info = EventBus.music
	if sound_info == false:
		SoundButton.hide()
		BlankSound.show()
	else:
		SoundButton.show()
		BlankSound.hide()
	if music_info == false:
		MusicButton.hide()
		BlankMusic.show()
	else:
		MusicButton.show()
		BlankMusic.hide()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		


func _on_music_button_pressed():
	EventBus.play_button_sound.emit()
	EventBus.music_change.emit()
	MusicButton.hide()
	BlankMusic.show()
		


func _on_sound_button_pressed():
	EventBus.play_button_sound.emit()
	EventBus.emit_signal("change_sound_first")
	SoundButton.hide()
	BlankSound.show()


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
	EventBus.play_button_sound.emit()
	get_tree().paused = false
	queue_free()


func _on_blank_sound_pressed():
	EventBus.play_button_sound.emit()
	EventBus.emit_signal("change_sound_first")
	SoundButton.show()
	BlankSound.hide()

func _on_blank_music_pressed():
	EventBus.play_button_sound.emit()
	EventBus.music_change.emit()
	MusicButton.show()
	BlankMusic.hide()
