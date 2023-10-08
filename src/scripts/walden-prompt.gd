extends Node2D



# Called when the node enters the scene tree for the first time.
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.is_done_talking = false
	$Background/textbox/Label.visible_characters = 0
	$Background/textbox/Label.text = Global.walden_dialog[0]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Background/textbox/Label.visible_characters == $Background/textbox/Label.text.length():
		Global.is_done_talking = true
	
func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.is_pressed() && Global.is_done_talking:
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")

