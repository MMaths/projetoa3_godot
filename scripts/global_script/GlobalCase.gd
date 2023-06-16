extends Node
class_name GlobalData

var found_clues: int

var levels_data:Dictionary = {
	1:[
		false,                       #Fase Selecionada
		false                        #Fase Concluida
	]
}

func read_dict() -> void:
	for key in levels_data.keys():
		found_clues += 1
