class ComputerSetter
  attr_reader :computer_selection

  def initialize
    @computer_selection = ask_computer
  end

  private

  def ask_computer
    computer_selection = []

    4.times do |seed|
    seed = rand(100)
      case
      when seed.between?(0, 16)
        computer_selection << "1"
      when seed.between?(17, 33)
        computer_selection << "2"
      when seed.between?(34, 49)
        computer_selection << "3"
      when seed.between?(50, 65) 
        computer_selection << "4"
      when seed.between?(66, 81)
        computer_selection << "5"
      when seed.between?(82, 100)
        computer_selection << "6"
      end
    end
    computer_selection
  end
end