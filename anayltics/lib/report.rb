require 'json'

# This class generates and reports all the stats about the data from a file
class Report
  def initialize 
    puts "What file would you like to load?"
    
    # retrieves all json files and prints them with their index number so the user can select
    data_dumps = Dir["mocked_data/*.json"]
    i = 0
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
    deck_1_number_wins = 0
    deck_2_number_wins = 0 
    deck_1_win_rate = 0
    deck_2_win_rate = 0
    total_win_rate= 0.0
    deck_1_win_turn = 0
    deck_2_win_turn = 0
    total_win_turn= 0.0
    deck_1_win_damage = 0
    deck_2_win_damage = 0 
    total_win_damage = 0.0
    
    
    # Get the total number of times each player won
    data.each do |item|
      if item['random_winner'] == 'Deck_1' 
        deck_1_number_wins = deck_1_number_wins +1
        deck_1_win_turn = deck_1_win_turn + item['random_win_turn']
        total_win_turn = total_win_turn + item['random_win_turn']
        deck_1_win_damage = deck_1_win_damage + item['damge_dealt_on_final_turn']
        total_win_damage = total_win_damage + item['damge_dealt_on_final_turn']
      else
        deck_2_number_wins = deck_2_number_wins +1
        deck_2_win_turn = deck_2_win_turn + item['random_win_turn']
        total_win_turn = total_win_turn + item['random_win_turn']
        deck_2_win_damage = deck_2_win_damage + item['damge_dealt_on_final_turn']
        total_win_damage = total_win_damage + item['damge_dealt_on_final_turn']
      end
    end
    
    # Calculate win % and convert that number to a float
    deck_1_win_rate = deck_1_number_wins/data.size.to_f * 100
    deck_2_win_rate = deck_2_number_wins/data.size.to_f * 100
    
    puts "Deck 1 wins #{deck_1_number_wins}/#{data.size} which is #{deck_1_win_rate}%"
    puts "Deck 2 wins #{deck_2_number_wins}/#{data.size} which is #{deck_2_win_rate}%"  

    # Calculate win damage and convert that number to a float
    deck_1_avg_win_damage = deck_1_win_damage/deck_1_number_wins.to_f
    deck_2_avg_win_damage = deck_2_win_damage/deck_2_number_wins.to_f
    total_win_damage = total_win_damage/data.size.to_f

    puts "Deck 1 on avgerage wins by dealing #{deck_1_avg_win_damage}"
    puts "Deck 2 on avgerage wins by dealing #{deck_2_avg_win_damage}"
    puts "On avgerage the game ends by dealing #{total_win_damage}" 
    
    # Calculate win damage and convert that number to a float
    deck_1_avg_win_damage = deck_1_win_damage/deck_1_number_wins.to_f
    deck_2_avg_win_damage = deck_2_win_damage/deck_2_number_wins.to_f
    total_win_damage = total_win_damage/data.size.to_f

    puts "Deck 1 on avgerage wins by dealing #{deck_1_avg_win_damage}"
    puts "Deck 2 on avgerage wins by dealing #{deck_2_avg_win_damage}"
    puts "On avgerage the game ends by dealing #{total_win_damage}" 
  end

  # Having each item broken out to a sperate method allows for a selective report

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