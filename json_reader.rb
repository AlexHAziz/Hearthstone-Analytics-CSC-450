require 'json'

# Example of how to read in a json file
# Also a performance test of how long it would take to load in a deck 
# Note: AllSets.json has a strange structure if you run into issue refer to this and deck_builder.rb 
# also puts statements outputting the class of the object your are examine from that file at a given time 
# are very helpful
class Json_reader
  file = File.open('json_files/AllSets.json', 'r')
  cards = JSON.parse(file.read)
  puts cards.class
  basic = cards['Basic']
  puts basic.class
  puts basic[1].class
  beginning = Time.now
  deck_1 = []
  deck_2 = []
  for i in 1..29
    search_for = 'Wrath of Air Totem'  
    basic.each do |card|
      if card["name"] == search_for
        deck_1.push(card)
        break
      end
    end
  end
  for i in 1..29
    search_for = 'Wrath of Air Totem'  
    basic.each do |card|
      if card["name"] == search_for
        deck_2.push(card)
        break
      end
    end
  end
  ending = Time.now
  puts ending - beginning
  puts deck_1
  puts deck_2
end