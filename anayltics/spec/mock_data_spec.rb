require 'mock_data'

describe MockData do
  test_obj = MockData.new()
  test_data = test_obj.create_data

  # Simple example test that checks that winner and looser aren't the same
  it 'checks that winner anr looser arent the same' do
    expect(test_data['random_winner']).to_not eq(test_data['random_looser'])
  end

  it 'checks that the game ended on or after turn 3' do
    expect(test_data['random_win_turn']).to be >=(3)
  end

  it 'checks that winners hp was less than or equal to 30' do
    expect(test_data['winners_hp']).to be <=(30)
  end

  it 'checks that winners hp was greater than 0' do
    expect(test_data['winners_hp']).to be >(0)
  end

  it 'checks that losers starting_hp hp was less than or equal to 30' do
    expect(test_data['losers_starting_hp']).to be <=(30)
  end

  it 'checks that leathal damge was dealt' do
    expect(test_data['damge_dealt_on_final_turn']).to be >=(test_data['losers_starting_hp'])
  end
  
  it 'checks that there are no more than 10 cards in a players hand' do
    expect(test_data['winner_cards_in_hand']).to be <=(10)
    expect(test_data['looser_cards_in_hand']).to be <=(10)
  end

  it 'checks that there are no more than 21 cards in a players deck' do
    expect(test_data['winner_cards_in_deck']).to be <=(21)
    expect(test_data['looser_cards_in_deck']).to be <=(21)
  end

  it 'checks that each player had no more than 7 minons in play' do
    expect(test_data['winner_number_of_minions']).to be <=(7)
    expect(test_data['looser_number_of_minions']).to be <=(7)
  end
end