extends Node2D
@export var level_num = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	print("level " + str(level_num) + "ready!")
	set_gems_label()
	for gem in $Gems.get_children():
		gem.gem_collected.connect(_on_gem_collected)

func _on_door_body_entered(body):
	if body == $Player:
		get_tree().change_scene_to_file("res://level_2.tscn")

func _on_gem_collected():
	set_gems_label()
func set_gems_label():
	$HUD/GemsLabel.text= "Gems: " + str(Global.gems_collected)
func _input(event):
	if event.is_action_pressed("reset_level"):
		get_tree().reload_current_scene.call_deferred()
		Global.gems_collected = 0
		set_gems_label()
