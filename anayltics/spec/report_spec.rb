#	Testing for the report class. It tests the methods within that class to make sure expected results are achieved.

require 'report'

describe Report do
  test_obj = Report.new()

  it 'checks calling analyze() passing an invalid file path will result in error' do
    expect{analyze("random/invalid/path")}.to raise_error
  end
  
  it 'checks calling generate_all() passing an invalid file path will result in error' do
    expect{generate_all("random/invalid/path")}.to raise_error
  end
  
  it 'checks calling get_win_rates() passing an invalid file path will result in error' do
    expect{get_win_rates("random/invalid/path")}.to raise_error
  end
  
  it 'checks calling get_win_turn() passing an invalid file path will result in error' do
    expect{get_win_turn("random/invalid/path")}.to raise_error
  end
  
  it 'checks calling get_win_damage() passing an invalid file path will result in error' do
    expect{get_win_damage("random/invalid/path")}.to raise_error
  end

  
end