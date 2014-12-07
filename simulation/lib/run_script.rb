=begin
  This script starts the simulation
=end
require_relative 'Game'
require_relative 'Hero'

hero_1 = Hero.new(JSON.parse(File.open('json_files/deck_1.json').read)["class"], JSON.parse(File.open('json_files/deck_1.json').read)["deck"])
hero_2 = Hero.new(JSON.parse(File.open('json_files/deck_2.json').read)["class"], JSON.parse(File.open('json_files/deck_2.json').read )["deck"])
this_game = Game.new(hero_1,hero_2)
this_game.play