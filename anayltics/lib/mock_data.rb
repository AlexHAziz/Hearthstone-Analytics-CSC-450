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
    random_win_turn           = (3..20).to_a.sample # assume games don't end before turn 3
    losers_starting_hp        = (1..30).to_a.sample # health can be btw 1 and 30
    damge_dealt_on_final_turn = (losers_starting_hp..40).to_a.sample # have to ensure lethal damage is dealt, therefore losers_starting_hp must be the lower bound
    winners_hp                = (1..30).to_a.sample # health can be btw 1 and 30
    winner_number_of_minions  = (0..7).to_a.sample # can only have 7 minons on the board at a time
    winner_cards_in_hand      = (0..10).to_a.sample # can only have 10 cards in hand at a time
    winner_cards_in_deck      = (0..21).to_a.sample # 21 is the most cards a deck could have if the game ended on turn 3
    looser_number_of_minions  = (0..7).to_a.sample # can only have 7 minons on the board at a time
    looser_cards_in_hand      = (0..10).to_a.sample # can only have 10 cards in hand at a time
    looser_cards_in_deck      = (0..21).to_a.sample # 21 is the most cards a deck could have if the game ended on turn 3
    reutrn_value = {
            'random_winner'             => random_winner, 
            'random_looser'             => random_looser,
            'random_win_turn'           => random_win_turn,
            'damge_dealt_on_final_turn' => damge_dealt_on_final_turn,
            'winners_hp'                => winners_hp,
            'winner_number_of_minions'  => winner_number_of_minions,
            'winner_cards_in_hand'      => winner_cards_in_hand,
            'winner_cards_in_deck'      => winner_cards_in_deck,
            'losers_starting_hp'        => losers_starting_hp,
            'looser_number_of_minions'  => looser_number_of_minions,
            'looser_cards_in_hand'      => looser_cards_in_hand,
            'looser_cards_in_deck'      => looser_cards_in_deck
          }
    return reutrn_value
  end
end
