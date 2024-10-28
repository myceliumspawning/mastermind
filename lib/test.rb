options = ["1", "2", "3", "4", "5", "6"]
possible_guesses = []
options.repeated_permutation(4) { |guess| possible_guesses << guess }

p possible_guesses.count