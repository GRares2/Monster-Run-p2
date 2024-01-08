extends Node

var gems_collected = 0

func _ready():
	print("level 1 ready")
	print_debug(gems_collected)

func _input(event):
	if event.is_action_pressed("return to main menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
