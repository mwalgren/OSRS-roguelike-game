extends Node


var _res_path:String = "res://resources/card_resource/"
var _results:Dictionary = {} #Data map for all cards in the res folder
var _tag_look_up:Dictionary = {} #data map for tags within resources (filtering system)


func _ready() -> void:
	_fetch_resources(_res_path)

#builds a data map of card ID's and Resources.
func _fetch_resources(_path):
	var _all_res = ResourceLoader.list_directory(_path)
	for res in _all_res:
		var _full_path = _path + res

		var _res_instance = ResourceLoader.load(_full_path)
		_tag_look_up.get_or_add(_res_instance.tags, _res_instance.card_id)
		_results.get_or_add(_res_instance.card_id, _res_instance)
	return _results


#get cards by ID
func get_card(id):
	if _results.has(id):
		print(_results[id])
		return _results[id]
	else: push_error("Card Resource Not Found")


#check to see if player deck has card
func has(id):
	if _results.has(id):
		return true
	else: return false


#filter cards by tag 
func filter_by_tags(tags):
	tags = tags.to_lower() #guard rails for case mismatches
	if _tag_look_up.has([tags]):
		print(true)
	else: push_warning("No Tags Found")
