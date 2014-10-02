require_relative 'Game'

this_game = Game.new
hero_1 = this_game.make_player(File.open('deck_1.json'))
hero_2 = this_game.make_player(File.open('deck_1.json'))
this_game.setup(hero_1,hero_2)
this_game.play