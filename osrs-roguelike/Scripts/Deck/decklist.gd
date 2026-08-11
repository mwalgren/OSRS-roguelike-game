extends Resource
class_name DeckList

var entries:Dictionary = {} 



func add(id, n:int = 1):
	entries[id] = max(0, entries.get(id,0) + n)
	if entries[id] < 1:
		entries.erase(id)

func remove(id, n:int = 1):
	if not entries.has(id):return
	var c = max(0,entries.get(id,0) + n)
	if entries.has(id):
		if entries[id] < 1: entries.erase(id)
		else: entries[id] = c

func count(id):
	return entries.get(id, 0)

func get_total():
	var t:= 0
	for i in entries.values(): t+= int(i)
	return t


func build_from_default(deck):
	entries.clear()
	entries = deck.default_deck.duplicate(true)
	print(entries, "Card Entries")


func as_manifest() -> Dictionary:
	return entries.duplicate(true)
