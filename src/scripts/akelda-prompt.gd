extends Node2D


var character = preload("res://src/scenes/characters/pre-industrial/akelda/akelda_char.tscn")
var town = preload("res://src/scenes/pre-industry.tscn")
var bkgd = preload("res://src/scenes/Background.tscn")
var tree = preload("res://src/scenes/Tree.tscn")
var text = preload("res://src/scenes/Textbox.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var treeNode = tree.instantiate()
	var textbox = text.instantiate()
	textbox.global_position = Vector2(-304,410)
	treeNode.set_meta("Health", 1)
	var bkgdNode = bkgd.instantiate(1)
	var townNode = town.instantiate()
	var charNode = character.instantiate()
	
	bkgdNode.add_child(townNode)
	bkgdNode.add_child(treeNode)
	bkgdNode.add_child(charNode)
	bkgdNode.add_child(textbox)
	add_child(bkgdNode)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventMouseButton:
		print(event)
		if event.is_pressed():
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")
