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
  cards.each do |sets|
    set_name = sets[0]
    if playable_sets.include? set_name
      cards[set_name].each do |card|
        #puts card.has_key?('playerClass')
        if !card.has_key?('playerClass') || card["playerClass"] == @new_hero
          available_cards.push(card["name"])
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
      if item == card
        count = count + 1
      end
    end
    count
  end

  available_cards.each do |card| 
    if available_cards.index(card) > 0
      puts "#{available_cards.index(card)}. #{card}"
    end
  end
  while @deck.length != 30
    puts 'Input the cards you would like to have in your deck'
    card = nil
    while card == nil
      card = gets.to_i
      if !card.between?(1, available_cards.size-1)
        puts "Out of range"
        puts 'Input the cards you would like to have in your deck'
        card = nil
      elsif check_occurences_of_card_deck(available_cards[card]) >= 2
        puts "#{available_cards[card]["name"]} is used twice already"
        puts 'Input the cards you would like to have in your deck'
        card = nil
      end
    end
    @deck.push(available_cards[card])
  end
  
  @deck.each { |card| puts card }
  #@new_hero = Hero.new(selected_class, @deck)
end