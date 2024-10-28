module Winnable
  def check_guess(p1_selection, p2_selection)
    both_correct = 0
    p1_selection_prime = []
    p2_selection_prime = []

    for i in 0..p1_selection.length-1
      if p1_selection[i] == p2_selection[i]
        both_correct += 1
      else
        p1_selection_prime << p1_selection[i]
        p2_selection_prime << p2_selection[i]
      end
    end
    
    color_correct = p1_selection_prime.intersection(p2_selection_prime).length
    [both_correct, color_correct]
  end
end