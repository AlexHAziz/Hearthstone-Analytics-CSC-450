require 'json'

# This class generates and reports all the stats about the data from a file
class Report
  def initialize 
    puts "What file would you like to load?"
    
    # retrieves all json files and prints them with their index number so the user can select
    data_dumps = Dir["mocked_data/*.json"]
    i          = 0
    data_dumps.each do |file|
      puts "#{i}. #{file}"
      i = i + 1
    end
    
    # user selects desired data set
    puts "Please select a file by number" 
    user_select = gets.to_i
    while user_select < 0 && user_select > data_rumps.size 
      puts "Please select a valid number" 
      user_select = gets.to_i
    end
    
    load_file = data_dumps[user_select]
    anaylize(load_file)
  end
  
  # Call all methods to generate and report all statics about the data 
  # accepts the input of a string that is the path to the file to be loaded
  def anaylize(load_file)
    generate_all(load_file)
=begin
    get_win_rates(load_file)
    get_win_turn(load_file)
    get_win_damage(load_file)
=end
  end

  # This method generates all the stats and is more efficient if we want to provide them 
  # all instead of a selective report
  def generate_all(load_file)
    data = JSON.parse(File.open("#{load_file}", "r").read) # Parse the json into an array
    deck_1_number_wins = 0.0
    deck_2_number_wins = 0.0 
    deck_1_win_rate    = 0.0
    deck_2_win_rate    = 0.0
    total_win_rate     = 0.0
    deck_1_win_turn    = 0.0
    deck_2_win_turn    = 0.0
    total_win_turn     = 0.0
    deck_1_win_damage  = 0.0
    deck_2_win_damage  = 0.0
    total_win_damage   = 0.0
    winner_hp          = 0.0
    looser_hp          = 0.0
    winner_cid         = 0.0 # cards in deck
    looser_cid         = 0.0 # cards in deck
    total_cid          = 0.0 # cards in deck
    winner_cih         = 0.0 # cards in hand
    looser_cih         = 0.0 # cards in hand
    total_cih          = 0.0 # cards in hand
    
    # Get the total number of times each player won
    data.each do |item|
      if item['random_winner'] == 'Deck_1' 
        deck_1_number_wins = deck_1_number_wins +1
        deck_1_win_turn    = deck_1_win_turn    + item['random_win_turn']
        total_win_turn     = total_win_turn     + item['random_win_turn']
        deck_1_win_damage  = deck_1_win_damage  + item['damge_dealt_on_final_turn']
        total_win_damage   = total_win_damage   + item['damge_dealt_on_final_turn']
      else
        deck_2_number_wins = deck_2_number_wins +1
        deck_2_win_turn    = deck_2_win_turn    + item['random_win_turn']
        total_win_turn     = total_win_turn     + item['random_win_turn']
        deck_2_win_damage  = deck_2_win_damage  + item['damge_dealt_on_final_turn']
        total_win_damage   = total_win_damage   + item['damge_dealt_on_final_turn']
      end
      winner_hp  = winner_hp  + item['winners_hp']
      looser_hp  = looser_hp  + item['losers_starting_hp']
      winner_cid = winner_cid + item['winner_cards_in_deck']
      looser_cid = looser_cid + item['looser_cards_in_deck']
      total_cid  = total_cid  + winner_cid + looser_cid
      winner_cih = winner_cid + item['winner_cards_in_hand']
      looser_cih = looser_cid + item['looser_cards_in_hand']
      total_cih  = total_cid  + winner_cid + looser_cid
    end
    
    # Calculate win % and convert that number to a float
    deck_1_win_rate = deck_1_number_wins/data.size.to_f * 100
    deck_2_win_rate = deck_2_number_wins/data.size.to_f * 100
    
    puts "Deck 1 wins #{deck_1_number_wins}/#{data.size} which is #{deck_1_win_rate}%"
    puts "Deck 2 wins #{deck_2_number_wins}/#{data.size} which is #{deck_2_win_rate}%"  

    # Calculate win turn and convert that number to a float
    deck_1_avg_win_turn = deck_1_win_turn/deck_1_number_wins.to_f
    deck_2_avg_win_turn = deck_2_win_turn/deck_2_number_wins.to_f
    total_win_turn      = total_win_turn/data.size.to_f

    puts "Deck 1 on avgerage wins on turn #{deck_1_avg_win_turn}"
    puts "Deck 2 on avgerage wins on turn #{deck_2_avg_win_turn}"
    puts "On avgerage the game ends on turn #{total_win_turn}" 
    
    # Calculate win damage and convert that number to a float
    deck_1_avg_win_damage = deck_1_win_damage/deck_1_number_wins.to_f
    deck_2_avg_win_damage = deck_2_win_damage/deck_2_number_wins.to_f
    total_win_damage      = total_win_damage/data.size.to_f

    puts "Deck 1 on avgerage wins by dealing #{deck_1_avg_win_damage}"
    puts "Deck 2 on avgerage wins by dealing #{deck_2_avg_win_damage}"
    puts "On avgerage the game ends by dealing #{total_win_damage}"
    
    # Calculate average hp and convert that number to a float
    winner_hp = winner_hp/data.size.to_f
    looser_hp = looser_hp/data.size.to_f

    puts "On avgerage the winner has #{winner_hp} hp on the final turn"
    puts "On avgerage the looser has #{looser_hp} hp at the start of the final turn"

    # Calculate average cards in deck and convert that number to a float
    winner_cid = winner_cid/data.size.to_f
    looser_cid = looser_cid/data.size.to_f
    total_cid  = total_cid/data.size.to_f

    puts "On avgerage the winner has #{winner_cid} cards in deck on the final turn"
    puts "On avgerage the looser has #{looser_cid} cards in deck on the final turn"
    puts "On avgerage the a player has #{total_cid} cards in deck on the final turn"

    # Calculate average cards in hand and convert that number to a float
    winner_cih = winner_cih/data.size.to_f
    looser_cih = looser_cih/data.size.to_f
    total_cih  = total_cih/data.size.to_f

    puts "On avgerage the winner has #{winner_cih} cards in hand on the final turn"
    puts "On avgerage the looser has #{looser_cih} cards in hand on the final turn"
    puts "On avgerage the a player has #{total_cih} cards in hand on the final turn"
  end

  # Having each item broken out to a sperate method allows for a selective report
  # Below are 3 basic examples of how this could be useful if the user is only interested
  # in one stat

  # Determines the win rate of each deck
  # accepts the input of a string that is the path to the file to be loaded
  def get_win_rates(load_file)
    data = JSON.parse(File.open("#{load_file}", "r").read) # Parse the json into an array
    deck_1_number_wins = 0
    deck_2_number_wins = 0 
    deck_1_win_rate = 0.0
    deck_2_win_rate = 0.0
    
    # Get the total number of times each player won
    data.each do |item|
      if item['random_winner'] == 'Deck_1' 
        deck_1_number_wins = deck_1_number_wins +1
      else
        deck_2_number_wins = deck_2_number_wins +1
      end
    end
    
    # Calculate win % and conver that number to a float
    deck_1_win_rate = deck_1_number_wins/data.size.to_f * 100
    deck_2_win_rate = deck_2_number_wins/data.size.to_f * 100
    
    puts "Deck 1 wins #{deck_1_number_wins}/#{data.size} which is #{deck_1_win_rate}%"
    puts "Deck 2 wins #{deck_2_number_wins}/#{data.size} which is #{deck_2_win_rate}%"
  end

  # Determines the average turn on which each deck wins 
  # accepts the input of a string that is the path to the file to be loaded
  def get_win_turn(load_file)
    data = JSON.parse(File.open("#{load_file}", "r").read) # Parse the json into an array
    deck_1_number_wins = 0
    deck_2_number_wins = 0 
    deck_1_win_turn = 0
    deck_2_win_turn = 0 
    total_win_turn = 0.0
    
    # Get the total number of times each player won
    data.each do |item|
      if item['random_winner'] == 'Deck_1' 
        deck_1_number_wins = deck_1_number_wins +1
        deck_1_win_turn = deck_1_win_turn + item['random_win_turn']
        total_win_turn = total_win_turn + item['random_win_turn']
      else
        deck_2_number_wins = deck_2_number_wins +1
        deck_2_win_turn = deck_2_win_turn + item['random_win_turn']
        total_win_turn = total_win_turn + item['random_win_turn']
      end
    end
    
    # Calculate win turn and convert that number to a float
    deck_1_avg_win_turn = deck_1_win_turn/deck_1_number_wins.to_f
    deck_2_avg_win_turn = deck_2_win_turn/deck_2_number_wins.to_f
    total_win_turn = total_win_turn/data.size.to_f

    puts "Deck 1 on avgerage wins on turn #{deck_1_avg_win_turn}"
    puts "Deck 2 on avgerage wins on turn #{deck_2_avg_win_turn}"
    puts "On avgerage the game ends on turn #{total_win_turn}" 
  end

  # Determines the average turn on which each deck wins 
  # accepts the input of a string that is the path to the file to be loaded
  def get_win_damage(load_file)
    data = JSON.parse(File.open("#{load_file}", "r").read) # Parse the json into an array
    deck_1_number_wins = 0
    deck_2_number_wins = 0 
    deck_1_win_damage = 0
    deck_2_win_damage = 0 
    total_win_damage = 0.0
    
    # Get the total number of times each player won
    data.each do |item|
      if item['random_winner'] == 'Deck_1' 
        deck_1_number_wins = deck_1_number_wins +1
        deck_1_win_damage = deck_1_win_damage + item['damge_dealt_on_final_turn']
        total_win_damage = total_win_damage + item['damge_dealt_on_final_turn']
      else
        deck_2_number_wins = deck_2_number_wins +1
        deck_2_win_damage = deck_2_win_damage + item['damge_dealt_on_final_turn']
        total_win_damage = total_win_damage + item['damge_dealt_on_final_turn']
      end
    end
    
    # Calculate win damage and convert that number to a float
    deck_1_avg_win_damage = deck_1_win_damage/deck_1_number_wins.to_f
    deck_2_avg_win_damage = deck_2_win_damage/deck_2_number_wins.to_f
    total_win_damage = total_win_damage/data.size.to_f

    puts "Deck 1 on avgerage wins by dealing #{deck_1_avg_win_damage}"
    puts "Deck 2 on avgerage wins by dealing #{deck_2_avg_win_damage}"
    puts "On avgerage the game ends by dealing #{total_win_damage}" 
  end
end

Report.new