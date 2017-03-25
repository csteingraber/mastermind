# This class contains the representation of the game board
# and the functionality to print it to the terminal as well
# as add colored pins to it.
class Board

  attr_reader :board

  # Initialize the board to be an empty 2D array.
  # Each child array must contain 4 elements: Row #,
  # string of colors, # of black pins, and # of white
  # pins.
  def initialize
    @board = []
  end

  # Prints visual representation of the board with 
  # row number, guess, and feedback columns.
  def print_board
    line_width = 31
    @board.each do |row|
      puts " _________________________________________________________________________"
      puts "|  #{row[0]}  |#{row[1].center(line_width)}|  #{row[2]}  |  #{row[3]}  |"
    end
    puts " _________________________________________________________________________"
    puts
  end

  # Takes in an array named "pins" and appends its 
  # contents to the board. "Pins" may either contain
  # the four guesses for the code or the black and white
  # feedback pins.
  def add(pins)
    if pins.size == 4 # if pins are the color pins
      pins = pins.join(" ")
      new_row = @board.size + 1
      @board << [(new_row).to_s, pins, "black pins: ", "white pins: "] 
    else
      @board[-1][2] += pins[0]
      @board[-1][3] += pins[1] 
    end
  end
end