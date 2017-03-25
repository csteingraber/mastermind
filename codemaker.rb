require "./player"

# This class acts as the container for the code
# to be guessed and provides the functionality
# for giving the associated black and white pins
# as feedback for every guess made.
class Codemaker < Player

  attr_reader :user

  # Initializes the Codemaker with a random code.
  def initialize
    puts "Would you like to be the codemaker? (y/n)"
    puts
    response = gets.chomp.downcase
    puts
    if response == "y"
      @user = "human"
      @code = input
    else
      if response != "n"
        puts "I'm not quite sure what you mean but I will just" \
             " allow the computer to be the codemaker and choose."
        puts
      end
      @user = "computer"
      @code = generate_code
    end
  end

  # Takes in an array containing the 
  # 4 color guesses from the previous
  # turn and generates a 2-element array
  # of strings containing # of black
  # pins and # of white pins.
  def give_feedback(guess)
    guess = guess.clone
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
end