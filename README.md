# Mastermind
Implemented [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)), which can be played on the command line. At the start,
users are given the option either to guess or to set the code.

## User as Player
If users choose to guess, a code will be set by the computer randomly. Users
then have 12 tries guess this combination, with the system providing feedback
after each turn.

## User as Setter
If users choose to set the code, the computer player will make guesses based
on [Knuth's algorithm](https://puzzling.stackexchange.com/questions/546/clever-ways-to-solve-mastermind). The computer player always gets it right within 5 tries.