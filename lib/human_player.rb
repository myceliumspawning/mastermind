class HumanPlayer
  attr_reader :human_selection

  def initialize(setter)
    @setter = setter
    @human_selection = ask_human
  end

  private

  def ask_human
    print "\n
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
    Make your guess by typing numbers that correspond to the colors below:
    1 = red, 2 = blue, 3 = yellow, 4 = green, 5 = magenta, 6 = cyan
    E.g., if your guess is [#{Rainbow("o").red}, #{Rainbow("o").blue}, #{Rainbow("o").yellow}, #{Rainbow("o").magenta}], you should type 1235 and press enter.\n
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
    \n"
    print "Make your selection: "
    selection = gets.chomp
    puts "\n"
    selection.split('')
  end
end