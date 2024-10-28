require 'rainbow'
require_relative 'lib/board'

# Game introduction
puts "\n
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
This is a game of #{Rainbow("Mastermind").firebrick}. You can be a #{Rainbow("'setter'").goldenrod} or a #{Rainbow("'player'").darkturquoise}. The #{Rainbow("setter").goldenrod}\n
will choose #{Rainbow("an series of 4 colors").underline}, which will be kept secret from the player.\n
The #{Rainbow("player").darkturquoise} will have #{Rainbow("12 chances").underline} to guess this series. After each guess, \n
the system will provide feedback. Each correctly guessed color in the right spot\n
will gain a point under #{Rainbow("both correct").bg(:red)}. Each correctly guessed color in\n
the wrong spot will gain a point under #{Rainbow("color correct").black.bg(:white)}.\n
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
\n"
print "Enter #{Rainbow("y").bright} to continue: "
answer = gets.chomp

while answer != 'y'
  print "Enter y to continue: "
  answer = gets.chomp
end

puts "\n
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
Here is an example:\n
Imagine the #{Rainbow("setter").goldenrod} has chosen [#{Rainbow("o").red}, #{Rainbow("o").blue}, #{Rainbow("o").yellow}, #{Rainbow("o").green}]. If the #{Rainbow("player").darkturquoise} guesses [#{Rainbow("o").red}, #{Rainbow("o").blue}, #{Rainbow("o").red}, #{Rainbow("o").yellow}],\n
they would receive 2 pts for #{Rainbow("both correct").bg(:red)} and 1 pt for #{Rainbow("color correct").black.bg(:white)} as feedback;\n
the red and blue are correctly colored and positioned, while the yellow is not!\n
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+\n
\n"
print "To be a setter, type s and enter. To be a player, type p and enter: "
sp_choice = gets.chomp

case
when sp_choice == 's'
  PlayGame.new(HumanSetter, ComputerPlayer, "human_set")
when sp_choice == 'p'
  PlayGame.new(ComputerSetter, HumanPlayer, "com_set")
else
  print "To be a setter, type #{Rainbow("s").bright} and enter. To be a player, type #{Rainbow("p").bright} and enter: "
  sp_choice = gets.chomp
end

