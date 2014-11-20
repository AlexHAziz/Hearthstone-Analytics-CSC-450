require_relative 'mock_data'
# Creates a json file of mock data 
class CreateDataDump
=begin
  Used for manual creation of data dumps
=end
  def initialize
    data_gen = MockData.new
    puts 'How many games would you like to simulate?'
    number_of_games = gets.to_i
    data = []
    for i in 0..number_of_games
      data.push(data_gen.create_data)
    end
    create_json(data)
  end

=begin
  Prints out the data passed in, which is created by the create_data method
=end
  def print_results(data)
    puts "Mock data from one game"
    puts "winner = #{data[random_winner]}"
    puts "looser = #{data[random_looser]}"
    puts "random_win_turn = #{data[random_win_turn]}"
    puts "damge_dealt_on_final_turn = #{data[damge_dealt_on_final_turn]}"
    puts "winners_hp = #{data[winners_hp]}"
    puts "winner_number_of_minions = #{data[winner_number_of_minions]}"
    puts "winner_cards_in_hand = #{data[winner_cards_in_hand]}"
    puts "winner_cards_in_deck = #{data[winner_cards_in_deck]}"
    puts "losers_starting_hp = #{data[losers_starting_hp]}"
    puts "looser_number_of_minions = #{data[looser_number_of_minions]}"
    puts "looser_cards_in_hand = #{looser_cards_in_hand}"
    puts "looser_cards_in_deck = #{looser_cards_in_deck}"
  end
  
=begin
  Creates a json file with the output of a number of games
=end
  def create_json(data)
    file_name = "data_set_#{Time.now.getutc}"
    output_file = File.new("mocked_data/#{file_name}.json", "w")
    output_file.write(JSON.generate(data))
  end
end

CreateDataDump.new