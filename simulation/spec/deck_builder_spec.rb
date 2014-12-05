#	Testing for the deck_builder class. It tests the methods within that class to make sure expected results are achieved.
#	Written by Conner Leo
#	Last edited on 12/5/2014
#	Filename = "deck_builder_spec.rb"

require 'deck_builder'

#creates tests for deck_builder class
describe Deck_builder do
  test_obj = Deck_builder.new()

  
  it 'checks that the occurences of a card in the deck is not negative' do
    expect(test_obj.check_occurences_of_card_deck(test_obj.deck[0]).to be >=(0)
  end
  
  it 'checks that the remove card method changed the deck length' do
	temp = test_obj.deck.length
	test_obj.remove_card
    expect(test_obj.deck.length).to be !=(temp)
  end
  
  it 'checks that the add card method changed the deck length' do
	temp = test_obj.deck.length
	test_obj.add_card
    expect(test_obj.deck.length).to be !=(temp)
  end

  
end