extends Node

signal expeirence_vial_collected(number: float)

func emit_experience_vial_collected(number: float):
	expeirence_vial_collected.emit(number)
