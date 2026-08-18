extends Resource
class_name CharacterState

#CharacterState represents the player & their persistent stats throughout runtime

const XP_TABLE := [40, 86, 258, 516, 860, 1289]

var character_template:Character

@export_category("Character Skills")


var skills = {"Attack": 1, "Strength" : 1, "Ranged" : 1, "Prayer" : 1, "Magic" : 1, "Defense" : 1, "HP": 1 }
var current_xp = {"Attack" : 0, "Strength" : 0, "Ranged" : 0, "Prayer" : 0, "Magic" : 0, "Defense" : 0  }

var current_deck:Dictionary
var current_inventory:Array [InventoryData]
var default_deck_list:DeckList

##pull character data into runtime character
func seed_character_data(t):
	default_deck_list = DeckList.new()
	default_deck_list.build_from_default(t.base_deck.default_deck)
	skills.merge(t.skills)
	current_deck.merge(default_deck_list.entries)

#add xp value to specific skill
func add_xp(xp_to_add:int, skill:String):
	current_xp[skill] += xp_to_add
	if current_xp[skill] >= XP_TABLE[skills[skill] -1]:
		level_up(skill)

#increase level and signal ui to update
func level_up(skill):
	skills[skill] += 1
