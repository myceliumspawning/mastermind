module Decoratable
  def decorate_player(selection)
    selection == "human" ? choice = @player.human_selection : choice = @player.computer_selection

    choice.map do |selection|
      case
      when selection == "1"
        selection = Rainbow("o").red
      when selection == "2"
        selection = Rainbow("o").blue
      when selection == "3"
        selection = Rainbow("o").yellow
      when selection == "4"
        selection = Rainbow("o").green
      when selection == "5"
        selection = Rainbow("o").magenta
      when selection == "6"
        selection = Rainbow("o").cyan
      end
    end
  end

  def decorate_feedback
    @feedback.map.with_index do |feedback, index|
      if index == 0
        feedback = "#{Rainbow("both correct").bg(:red)}: #{feedback}"
      else
        feedback = "#{Rainbow("color correct").black.bg(:white)}: #{feedback}"
      end
    end
  end
end