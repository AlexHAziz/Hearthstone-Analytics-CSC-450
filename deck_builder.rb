require 'json'
require_relative 'hero'

# Need to create hero based off of input 
# Need to add the method to covert the created hero to json then export it to the file
# Need to add editing support
# Builds a deck and hero then exports the info to json which is read in during simulation
class Deck_builder 
  puts 'Please pick a class.'
  heroes = [
    'Druid',
    'hunter',
    'mage',
    'paladin',
    'priest',
    'rouge',
    'shaman',
    'warlock',
    'warrior',
  ]
  playable_sets = [
    'Basic',
    'Curse of Naxxramas',
    'Expert'
  ]
  heroes.each do |item|
    puts "#{heroes.index(item)+1}. #{item}"
  end
  selected_class = 0
  # Waits for valid input, to_i handles if user gives anything but a int
  while !selected_class.to_i.between?(1,9)
    puts 'Please type the number of the class you would like to select.'
    selected_class = gets
  end
  
  file = File.open('json_files/AllSets.json', 'r')
  cards = JSON.parse(file.read)
  available_cards = [] # set of cards that the selected hero can use
  banned_list = []
  cards.each do |sets|
    set_name = sets[0]
    if playable_sets.include? set_name
      cards[set_name].each do |card|
        if (!card.has_key?('playerClass') || card["playerClass"] == @new_hero) && !banned_list.include?(card)
          available_cards.push(card)
        end
      end
    end
  end
    
  @deck = []
  # Need to Add a check for only 1 of each legendary
  # insures each card is used with in the allowed number of times 
  # once for a legendary
  # twice for everything else 
  def self.check_occurences_of_card_deck(card)
    count = 0
    @deck.each do |item|
      if item["name"] == card["name"]
        count = count + 1
      end
    end
    count
  end

  i = 0
  available_cards.each do |card| 
    puts "#{i}. #{card["name"]}"
    i = i + 1
  end
  
  first_card_added = true
  while @deck.length != 30
    card = nil
    while card == nil
      puts 'Input the cards you would like to have in your deck'
      card = gets.to_i
      case
      when !card.between?(1, available_cards.size-1)
        puts "Out of range"
        card = nil
      when available_cards[card]["rarity"] == "Legendary" && check_occurences_of_card_deck(available_cards[card]) == 1 
        puts "#{available_cards[card]["name"]} is Legendary and has been used already"
        card = nil
      when check_occurences_of_card_deck(available_cards[card]) >= 2
        puts "#{available_cards[card]["name"]} is used twice already"
        card = nil
      end
    end
    if first_card_added == true
      @deck[0] = available_cards[card]
      first_card_added = false
    else
      @deck.push(available_cards[card])
    end
  end
  
  puts "Please enter a name for this deck."
  deck_name = gets.chomp
  while File.exists?("json/#{deck_name}.json")
    puts "That name is already used, please enter a different name for this deck."
    deck_name = gets.chomp
  end
  data_to_be_output = {}
  data_to_be_output["class"] = heroes[selected_class.to_i]
  data_to_be_output["deck"] = @deck
  output_file = File.new("json_files/#{deck_name}.json", "w")
  output_file.write(JSON.generate(data_to_be_output))
end