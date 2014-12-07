=begin 
  This class simulates the game and generates a json file with the results to be anaylized
=end 
class Game
  attr_accessor :game_battlefield # get battlefields from each hero
  attr_accessor :current_turn_number
  attr_accessor :current_player # hero who's turn it is
  attr_accessor :waiting_player

  # Setup game here
  # Takes care of basic game initialization and is also the constructor for this class
  def initialize(player1, player2)
    @game_battlefield = [] # get battlefields from each hero
    @current_turn_number = 0
    @current_player = nil #hero who's turn it is
    @waiting_player = nil

    if Random.rand(1..2) == 1
      puts "#{player1.name} goes 1st"
      @current_player = player1
      @waiting_player = player2
    else
      puts "#{player2.name} goes 1st"
      @current_player = player2
      @waiting_player = player1
    end
    @waiting_player.hand.push('The Coin')
    @current_player.health = @waiting_player.health = 30
    @current_player.shuffle
    @waiting_player.shuffle
    @current_player.draw_card(3)
    @waiting_player.draw_card(4)
    @game_battlefield.push(@current_player.battlefield)
    @game_battlefield.push(@waiting_player.battlefield)
  end
  
=begin
  Governs the simulation and directs when a player wins then 
  outputs data in a Hash with the following key's in the following order
  winner
  looser
  win_turn
  damge_dealt_on_final_turn
  winners_hp
  winner_number_of_minions
  winner_cards_in_hand
  winner_cards_in_deck
  losers_starting_hp
  looser_number_of_minions
  looser_cards_in_hand
  looser_cards_in_deck
=end
  # play game here
  def play
    # check players life
    game_over = false
    while game_over == false
      if @current_player.health <= 0 && @waiting_player.health > 0
        puts "#{@waiting_player.name} wins."
      elsif @waiting_player.health <= 0 && current_player.health > 0
        puts "#{@current_player.name} wins."
      else
        @current_turn_number = @current_turn_number + 1
        @current_player.draw_card(1)
        if @current_player.total_mana < 10 
          @current_player.total_mana = @current_player.total_mana + 1
        end
        @current_player.mana_available = @current_player.total_mana
        @current_player.battlefield.each do |character|
          character.attacked_this_turn = false
        end
        playable_cards = @current_player.determine_playable_cards
        possible_attackers = @current_player.determine_possible_attackers
        possible_targets = @current_player.determine_tragetable_characters
        end_of_turn_effects = [] # push effects to this array
        @game_battlefield.each do |player_battlefield|
          player_battlefield.each do |item|
            if item["text"].contains('End of turn')
              item.keyowords['End of turn']
              end_of_turn_effects.push[item]
            end
          end
        end
        possible_moves = determine_moves(playable_cards)
        move = pick_move(possible_moves)
        execute_move(move)
        end_turn()
      end
      
      winner                    = ""
      looser                    = ""
      winners_hp                = 0
      winner_number_of_minions  = 0
      winner_cards_in_hand      = 0
      winner_cards_in_deck      = 0
      losers_starting_hp        = 0
      looser_number_of_minions  = 0
      looser_cards_in_hand      = 0
      looser_cards_in_deck      = 0
      damge_dealt_on_final_turn = 0 # Fill in
      if @current_player.health <= 0 && @waiting_player.health > 0
        winner                    = @waiting_player.name
        looser                    = @current_player.name
        winners_hp                = @waiting_player.health
        winner_number_of_minions  = @waiting_player.battlefield.size
        winner_cards_in_hand      = @waiting_player.hand.size
        winner_cards_in_deck      = @waiting_player.deck.size
        losers_starting_hp        = 0 # Fill in
        looser_number_of_minions  = @current_player.battlefield.size
        looser_cards_in_hand      = @current_player.hand.size
        looser_cards_in_deck      = @current_player.deck.size
        damge_dealt_on_final_turn = 0 # Fill in
      elsif @waiting_player.health <= 0 && current_player.health > 0
        winner                    = @current_player.name
        looser                    = @waiting_player.name
        winners_hp                = @current_player.health
        winner_number_of_minions  = @current_player.battlefield.size
        winner_cards_in_hand      = @current_player.hand.size
        winner_cards_in_deck      = @current_player.deck.size
        losers_starting_hp        = 0 # Fill in
        looser_number_of_minions  = @waiting_player.battlefield.size
        looser_cards_in_hand      = @waiting_player.hand.size
        looser_cards_in_deck      = @waiting_player.deck.size
      end 
      win_turn = @current_turn_number
      data = {
            'winner'                    => winner, 
            'looser'                    => looser,
            'win_turn'                  => win_turn,
            'damge_dealt_on_final_turn' => damge_dealt_on_final_turn,
            'winners_hp'                => winners_hp,
            'winner_number_of_minions'  => winner_number_of_minions,
            'winner_cards_in_hand'      => winner_cards_in_hand,
            'winner_cards_in_deck'      => winner_cards_in_deck,
            'losers_starting_hp'        => losers_starting_hp,
            'looser_number_of_minions'  => looser_number_of_minions,
            'looser_cards_in_hand'      => looser_cards_in_hand,
            'looser_cards_in_deck'      => looser_cards_in_deck
          }
      create_data(data)
    end
  end
  
  # Provides the structure and order of operations for a turn in the simulation
  def turn()
    pick_playable_card()
    attack()
    pick_playable_card()
    end_turn()
  end
  
  # determines all feasible moves that could be selected 
  # takes a list of all playable cards as an argument
  def determine_moves(playable_cards)
  end
  
  # This the AI it selects the best possible move from a list of moves
  # takes a list of possible moves as an argument 
  def pick_move (possible_moves)
    # determine which move is most advantageous based on both players life, cards in hand, cards in play
  end
  
  # Preforms the decided upon move 
  # takes the selected move as an argument
  def execute_move (move)
    # make that move and end turn 
  end
  
  # Executes all end of turn effects 
  def end_turn
    # run all end of turn effects 
    @current_player.attack = 0 
  end
  
  # Simulates an attack within the game
  # accepts an attacking character and a target character as arguments
  def attack (attacker, target)
    target.health = target.health - attacker.attack
    attacker.health   = attacker.health - target.attack
    attacker.attacked_this_turn = true
  end

  # Creates a json file of the dat from the sim
  def create_data(data)
    file_name = "data_set_#{Time.now.getutc}"
    output_file = File.new("data/#{file_name}.json", "w")
    output_file.write(JSON.generate(data))  
  end
end
