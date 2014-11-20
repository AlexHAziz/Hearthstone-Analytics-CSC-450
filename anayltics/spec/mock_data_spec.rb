require 'mock_data'

describe MockData do
  test_obj = MockData.new()
  test_data = test_obj.create_data

  # Simple example test that checks that winner and looser aren't the same
  it 'checks that winner anr looser arent the same' do
    expect(test_data['random_winner']).to_not eq(test_data['random_looser'])
  end
  
=begin 
  Please write more tests about mock_data here
=end 
end