#	Testing for the hero class. It tests the methods within that class to make sure expected results are achieved.
#	Written by Conner Leo
#	Last edited on 12/5/2014
#	Filename = "hero_spec.rb"

require 'hero'

#creates tests for deck_builder class
describe Hero do
  test_obj = Hero.new()
  
  it 'checks that draw card pushes a card from the deck to the hand' do
	tempDeckSize = test_obj.deck.length
	tempHandSize = test_obj.hand.length
	test_obj.draw_card(1)
    expect(test_obj.deck.length).to be ==(tempDeckSize-1)
	expect(test_obj.hand.length).to be ==(tempHandSize+1)
  end
  
  

  
end