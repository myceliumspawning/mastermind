# The computer as player will solve the problem using Knuth's algorithm.
class ComputerPlayer
  include Winnable
  attr_accessor :possible_guesses, :feedback
  attr_reader :computer_selection

  COMPUTER_FIRST_GUESS = ["1", "1", "2", "2"]
  OPTIONS = ["1", "2", "3", "4", "5", "6"]

  def initialize(setter)
    @setter = setter
    @computer_selection = COMPUTER_FIRST_GUESS
    @possible_guesses = []
    generate_possibilities
    @feedback = []
  end

  def set_feedback(feedback)
    @feedback = feedback
    ask_computer
  end

  private

  def generate_possibilities
    OPTIONS.repeated_permutation(4) { |guess| @possible_guesses << guess }
  end

  def ask_computer
      @possible_guesses.filter! do |guess| 
        check_guess(guess, @computer_selection) == @feedback
      end

      hashed_guesses = {}
      hashed_guesses = @possible_guesses.to_h { |guess| [guess, Hash.new] }

      # Calculate the least worst scenario
      hashed_guesses.each do |key1, value1|
        hashed_guesses.each do |key2, value2|
          result = check_guess(key1, key2)
          value1.key?(result) ? value1[result] += 1 : value1[result] = 0
        end
      end

      # Sort probabilities for each possibility from lowest to highest 
      hashed_guesses.map do |key1, value1|
        hashed_guesses[key1] = value1.sort_by(&:last).pop.pop
      end

      # Sort the possibilities according to the highest probability, then obtain the first possibility as the next guess
      @computer_selection = hashed_guesses.sort_by(&:last).shift.shift
  end
end