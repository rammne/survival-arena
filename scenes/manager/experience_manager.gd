extends Node

var current_expeirence = 0


func _ready():
	GameEvents.expeirence_vial_collected.connect(on_experience_vial_collected)


func increment_experience(number: float):
	current_expeirence += number
	print(current_expeirence)
	
	
func on_experience_vial_collected(number: float):
	increment_experience(number)
