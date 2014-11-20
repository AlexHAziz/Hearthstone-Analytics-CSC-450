require 'json'

# This generates mock data about the results of a game
class MockData
=begin
  outputs data in a Hash with the following key's in the following order
  random_winner
  random_looser
  random_win_turn
  damge_dealt_on_final_turn
  winners_hp
  winner_number_of_minions
  winner_cards_in_hand
  winner_cards_in_deck
  losers_starting_hp
  looser_number_of_minions
  looser_cards_in_hand
  looser_cards_in_deck
=end
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
end
