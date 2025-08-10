extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"../../AudioStreamPlayer".volume_db = -80
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_animation_player_animation_finished(anim_name):	
	$"../../AudioStreamPlayer".volume_db = -10
	$"../../AudioStreamPlayer".play()
	queue_free()


func _on_animated_sprite_2d_animation_finished():
	$AudioStreamPlayer2D.stop()
	$Timer.start()


func _on_timer_timeout():
	$AudioStreamPlayer2D2.play()
