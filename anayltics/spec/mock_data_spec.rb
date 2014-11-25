require 'mock_data'

describe MockData do
  test_obj = MockData.new()
  test_data = test_obj.create_data

  # Simple example test that checks that winner and looser aren't the same
  it 'checks that winner anr looser arent the same' do
    expect(test_data['random_winner']).to_not eq(test_data['random_looser'])
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

=begin 
  Please write more tests about mock_data here
=end 
end