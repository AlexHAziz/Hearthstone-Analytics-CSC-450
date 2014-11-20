require 'json'

class MockData
  def initialize
    puts 'How many games would you like to simulate?'
    number_of_games = gets.to_i
    data = []
    for i in 0..number_of_games
      data.push(create_data)
    end
    create_json(data)
  end
  
  def create_data
    random_winner = ['Deck_1','Deck_2'].sample
    random_looser = 
      if random_winner == 'Deck_1'
        'Deck_2'
      else
        'Deck_1'
      end
    random_win_turn = (3..20).to_a.sample
    damge_dealt_on_final_turn = (1..40).to_a.sample
    winners_hp = (1..30).to_a.sample
    winner_number_of_minions = (0..7).to_a.sample
    winner_cards_in_hand = (0..10).to_a.sample
    winner_cards_in_deck = (0..21).to_a.sample
    losers_starting_hp = (1..30).to_a.sample
    looser_number_of_minions = (0..7).to_a.sample
    looser_cards_in_hand = (0..10).to_a.sample
    looser_cards_in_deck = (0..21).to_a.sample
    reutrn_value = {'random_winner' => random_winner, 
            'random_looser' => random_looser,
            'random_win_turn' => random_win_turn,
            'damge_dealt_on_final_turn' => damge_dealt_on_final_turn,
            'winners_hp' => winners_hp,
            'winner_number_of_minions' => winner_number_of_minions,
            'winner_cards_in_hand' => winner_cards_in_hand,
            'winner_cards_in_deck' => winner_cards_in_deck,
            'losers_starting_hp' => losers_starting_hp,
            'looser_number_of_minions' => looser_number_of_minions,
            'looser_cards_in_hand' => looser_cards_in_hand,
            'looser_cards_in_deck' => looser_cards_in_deck
          }
    return reutrn_value
  end

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
  
  def create_json(data)
    file_name = "data_set_#{Time.now.getutc}"
    output_file = File.new("mocked_data/#{file_name}.json", "w")
    output_file.write(JSON.generate(data))
  end
end

MockData.new