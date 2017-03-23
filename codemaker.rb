# This class acts as the container for the code
# to be guessed and provides the functionality
# for giving the associated black and white pins
# as feedback for every guess made.
class Codemaker

  # Initializes the Codemaker with a random code.
  def initialize
    @code = generate_code
  end

  # Takes in an array containing the 
  # 4 color guesses from the previous
  # turn and generates a 2-element array
  # of strings containing # of black
  # pins and # of white pins.
  def give_feedback(guess)
    code = Array.new(@code)
    positions = [] # Used to remember index of colors
                   # that are both correct and in the 
                   # right postiion.
    black_pins = 0
    white_pins = 0

    4.times do |index|
      if guess[index] == code[index]
        black_pins += 1
        positions << index
      end
    end

    # Filter out the correclty chosen and positioned colors from 
    # the guess and the true code,
    positions.each do |spot|  
      guess.delete_at(spot)
      code.delete_at(spot)
      positions.map! { |element| element - 1 } # Have to shift all the indexes
                                               # back 1 since the guess and code
                                               # arrays will have their indicies
                                               # recalculated after the delete_at.
    end

    guess.each do |color|
      if code.include?(color)
        white_pins += 1
        code.delete_at(code.find_index(color))
      end
    end

    [black_pins.to_s, white_pins.to_s]
  end

  private

  # Creates and returns an array of four random colors.
  def generate_code
    code = []

    4.times do 
      choice = rand(6) + 1 
      case(choice)
      when 1 then code << "red"
      when 2 then code << "green"
      when 3 then code << "blue"
      when 4 then code << "orange"
      when 5 then code << "yellow"
      when 6 then code << "brown"
      end
    end

    code = "red white blue green".split
  end
end