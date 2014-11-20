require "json"
require_relative "hero"

# Need to add editing support

# Builds a deck and hero then exports the info to json which is read in during simulation
class Deck_builder 
  selected_class = 0
  @available_cards = [] # array of cards that the selected hero can use
  @banned_list = [] # array containing the names of cards that aren"t playable
  @deck = [] # array containing the cards that will be exported

  # List of available heroes 
  @heroes = [
    "Druid",
    "hunter",
    "mage",
    "paladin",
    "priest",
    "rouge",
    "shaman",
    "warlock",
    "warrior",
  ]

  # List of playable sets 
  @playable_sets = [
    "Basic",
  ]

  # Asks user to select a hero
  puts "Please select a hero class."
  @heroes.each do |item|
    puts "#{@heroes.index(item)+1}. #{item}"
  end
  # Waits for valid input, to_i handles if user gives anything but a int
  while !selected_class.to_i.between?(1,9)
    puts "Please type the number of the class you would like to select."
    selected_class = gets
  end

  # Opens the Json file and parses it to report the cards the user can select
  file = File.open("json_files/AllSets.json", "r")
  cards = JSON.parse(file.read)
  cards.each do |sets|
    set_name = sets[0]
    if @playable_sets.include? set_name
    cards[set_name].each do |card|
      if (!card.has_key?("playerClass") || card["playerClass"] == @new_hero) && !@banned_list.include?(card)
      @available_cards.push(card)
      end
    end
    end
  end
  @available_cards.each do |card| 
    puts "#{@available_cards.index(card)}. #{card["name"]}"
  end

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
  
  # removes cards to @deck
  def self.remove_card
    @deck.each do |card|
      puts "#{@deck.index(card)+1}. #{card["name"]}"
    end
    card = nil
    while card == nil
      puts "Please select a card to remove."
      card = gets.to_i
      if !card.between?(1, @deck.size)
        puts "Out of range"
        card = nil
      else
        @deck.delete_at(card-1)
      end
    end
  end 

  @first_card_added = true # needed so that the first element of the array, which is by default nil, is replaced
  # adds cards to @deck
  def self.add_card
    # Check that the deck doesn"t have more 30 cards
    if @deck.length < 30
      card = nil
      while card == nil
        puts "Input the cards you would like to have in your deck"
        card = gets.to_i
        case
        when !card.between?(1, @available_cards.size-1)
          puts "Out of range"
          card = nil
        when @available_cards[card]["rarity"] == "Legendary" && check_occurences_of_card_deck(@available_cards[card]) == 1 
          puts "#{@available_cards[card]["name"]} is Legendary and has been used already"
          card = nil
        when check_occurences_of_card_deck(@available_cards[card]) >= 2
          puts "#{@available_cards[card]["name"]} is used twice already"
          card = nil
        end
      end
      if @first_card_added == true
        @deck[0] = @available_cards[card]
        @first_card_added = false
      else
        @deck.push(@available_cards[card])
      end
    else
      puts "Deck already has 30 cards please remove some cards before adding more"
    end
  end
  
  # Waits for user to finish editing the deck before writing to a file 
  finalize_deck = false
  while finalize_deck == false
    user_input = nil
    acceptable_input = []
    if @deck.size < 30
      if @deck.size == 0
        add_card
      else
        acceptable_input = ["A","a","R","r"]
        while user_input == nil
          puts "Would you like to add (A/a) or remove(R/r) a card?"
          user_input = gets.chomp
          if acceptable_input.include?(user_input)
            if user_input == "A" || user_input == "a"
              add_card
            else
              remove_card
            end
          else
            user_input = nil
          end
        end
      end
    else
      acceptable_input = ["F","f","R","r"]
      while user_input == nil
        puts "Would you like to remove(R/r) a card or finalize(F/f) the deck?"
        user_input = gets.chomp
        if acceptable_input.include?(user_input)
          if user_input == "R" || user_input == "r"
            remove_card
          else
            finalize_deck = true
          end
        else
          user_input = nil
        end
      end
    end
  end
  
  # Writes users deck to a json file
  puts "Please enter a name for this deck."
  deck_name = gets.chomp
  while File.exists?("json/#{deck_name}.json")
    puts "That name is already used, please enter a different name for this deck."
    deck_name = gets.chomp
  end
  data_to_be_output = {}
  data_to_be_output["class"] = @heroes[selected_class.to_i-1]
  data_to_be_output["deck"] = @deck
  output_file = File.new("json_files/#{deck_name}.json", "w")
  output_file.write(JSON.generate(data_to_be_output))
end
