extends RefCounted
class_name DeckInstance


var deck_array:Array = []
var hand_array:Array = []
var discard_array:Array = []


func reset_deck():
	deck_array = []
	hand_array = []


func build_from_decklist(deck:DeckList):
	if !deck:
		return
	var curr_deck = deck.as_manifest()
	for id in curr_deck.keys():
		var card = CardRegistry.get_card(id)
		var count = curr_deck[id]
		for n in range(count):
			var card_instance = create_card_inst(card)
			deck_array.append(card_instance)
	deck_array.shuffle()


func draw(n:int = 1):
	if deck_array.is_empty():
		push_error("No cards left in deck")
		return
	if deck_array.size() < n:
		push_error("Not enough cards in the draw pile")
		return 
	for num in range(n):
		var card_to_draw = deck_array.pop_front()
		hand_array.append(card_to_draw)

func play_from_hand(card):
	if hand_array.has(card):
			hand_array.erase(card)
	else: push_error("Card not found in Hand Array")

func discard(card:CardInstance):
	discard_array.append(card)


func is_deck_empty() ->bool:
	return deck_array.is_empty()

func get_deck_size():
	return deck_array.size()


func create_card_inst(card):
	var card_instance = CardInstance.new()
	card_instance.card_definition = card
	card_instance.dmg = card.dmg
	card_instance.armor = card.armor
	return card_instance
