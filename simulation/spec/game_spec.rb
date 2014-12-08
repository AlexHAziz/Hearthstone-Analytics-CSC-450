 #	Testing for the Game class. It tests the methods within that class to make sure expected results are achieved.
#	Written by Conner Leo
#	Last edited on 12/5/2014
#	Filename = "game_spec.rb"

require 'game'

#creates tests for game class
describe Game do
  test_obj = game.new()

  it 'checks that initializing with one player throws an error' do
	expect{initialize(player)}.to raise_error
  end
  
  it 'checks that initializing with more than 2 players throws an error' do
	expect{initialize(player1, player2, player3)}.to raise_error
  end
  

  
end