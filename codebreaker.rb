require "./player"

# This class provides the basic functionality 
# for making guesses toward the code.
class Codebreaker < Player
  # Initializes instance variables that 
  # are useful only when the computer is
  # playing as codebreaker
  def initialize
    @previous_black_pins = -1 # -1 to distinguish between first round
                              # of feedback and every other round.
    @previous_guesses = []
    @known_pins = 0 
  end

  # This method is used when the user of the 
  # game chooses to be the codemaker instead.
  # This method takes in an array of strings
  # representing the last row of the game board
  # and return a new guess array.
  def computer_guess(row)
    code = []
    if row.nil? # if first guess
      code = generate_code
      @previous_guesses << code[0]

    else
      current_black_pins = row[2][-1]
      last_guess = row[1].split

      if (@previous_black_pins != -1) && (current_black_pins > @previous_black_pins)
        @known_pins += 1
        @previous_black_pins = current_black_pins # Update record of black pins for future turns
        @previous_guesses = [last_guess[@known_pins]] # Start off with next color to the right
                                                      # and record it as your previous guess since
                                                      # we are about to guess a new color in its
                                                      # place.

      elsif (@previous_black_pins != -1) && (current_black_pins < @previous_black_pins)
        last_guess[@known_pins] = @previous_guesses[-2] # Since black pins went down after our last guess,
                                                        # we should go back to our guess before the last one. 
        @known_pins += 1
        @previous_guesses = [last_guess[@known_pins]] # Start off with next color to the right
                                                      # and record it as your previous guess since
                                                      # we are about to guess a new color in its
                                                      # place.

      elsif @previous_black_pins == -1 # If it's the first round.
         @previous_black_pins = current_black_pins  # Update record of black pins for future turns.
      end

      guess = (@@accepted_colors - @previous_guesses).sample
      @previous_guesses << guess
      last_guess[@known_pins] = guess # Keep everything the same as your last guess except for the 
                                      # current color that we're guessing.
      code = last_guess
    end

    code
  end
end