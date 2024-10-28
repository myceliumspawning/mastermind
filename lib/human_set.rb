class HumanSetter
  attr_reader :human_selection

  def initialize
    @human_selection = ask_human
  end

  private

  def ask_human
    print "\n
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
    Set your code by typing numbers that correspond to the colors below:
    1 = red, 2 = blue, 3 = yellow, 4 = green, 5 = magenta, 6 = cyan
    E.g., if you want to choose [#{Rainbow("o").red}, #{Rainbow("o").blue}, #{Rainbow("o").yellow}, #{Rainbow("o").magenta}], you should type 1235 and press enter.\n
    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
    \n"
    print "Set your code: "
    selection = gets.chomp
    puts "\n"
    selection.split('')
  end
end