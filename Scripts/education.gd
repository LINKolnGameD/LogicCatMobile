extends Control
@onready var MainScene = $"../.."
@onready var AnimationEd = $AnimationPlayer
@onready var BackGround = $Background
@onready var Skip = $Skip
var animation_finished = false
# Called when the node enters the scene tree for the first time.
func _ready():
	EventBus.if_need_education.connect(need_educ)
	Skip.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if AnimationEd.is_playing():
		if Input.is_action_just_released("click"):
			Skip.show()
#		if Skip.visible and Input.is_action_just_pressed("click"):
			if Input.is_action_pressed("click"):
				queue_free()
	if animation_finished == true and Input.is_action_just_pressed("click"):
		EventBus.play_button_sound.emit()
		queue_free()

func need_educ(level):
	if level == 1:
		AnimationEd.play("Education_Anim")
		BackGround.Pattern.modulate = Color(1,1,1,1)
	else:
		queue_free()

func _on_animation_player_animation_finished(anim_name):
	animation_finished = true


func _on_skip_pressed():
	EventBus.play_button_sound.emit()
	queue_free()
