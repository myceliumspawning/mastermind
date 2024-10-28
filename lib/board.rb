require_relative 'computer_set'
require_relative 'human_player'
require_relative 'check'
require_relative 'decoration'
require_relative 'computer_player'
require_relative 'human_set'

class PlayGame
  include Winnable
  include Decoratable
  attr_reader :board, :feedback, :setter, :player, :game_type
  attr_writer :rounds

  def initialize (setter, player, game_type)
    @board = Array.new(12) {Array.new(4, ' ')}
    @setter = setter.new
    @player = player.new(@setter)
    @game_type = game_type
    @rounds = 0
    @feedback = []
    play
  end

  private

  def play
    loop do
      # print @setter.computer_selection # (switch on to test computer setter route)
      if game_type == "com_set"
        @feedback = check_guess(@setter.computer_selection, @player.human_selection)
      elsif game_type == "human_set"
        @feedback = check_guess(@setter.human_selection, @player.computer_selection)
      end
      @rounds += 1
      update_board
      print_board
      if check_win? == true
        return
      else
        if self.game_type == "com_set"
          @player = HumanPlayer.new(0)
        end
      end
    end
  end

  def check_win?
    if feedback == [4, 0]
      puts "The player wins!"
      true
    elsif @rounds == 12
      puts "The setter wins!"
      true
    else
      false
    end
  end

  def update_board
    game_type == "com_set" ? safe_map = decorate_player("human") : safe_map = decorate_player("computer")
    feedback = decorate_feedback
    if game_type == "com_set"
      @board[-(@rounds)] = safe_map + [" "] + feedback
    elsif game_type == "human_set"
      @board[-(@rounds)] = safe_map + [" "] + feedback
      @player.set_feedback(@feedback)
    end
  end

  def print_board
    column_separator = "|"
    row_separator = "---------"

    puts "\n"
    puts row_separator
    @board.each do |row|
      print column_separator
      row.each { |cell| print "#{cell}|" }
      puts "\n" + row_separator
    end
  end
end