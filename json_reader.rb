require 'json'

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