# This class contains the representation of the game board
# and the functionality to print it to the terminal as well
# as clear it for new rounds.
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

  # Empties the board for a new round.
  def clear_board
    @board.clear
  end

  # Takes in an array named "pins" and appends its 
  # contents to the board. "Pins" may either contain
  # the four guesses for the code or the black and white
  # feedback pins.
  def add(pins)
    if pins.size == 4 # if pins are the color pins
      pins = pins.join(" ")
      row = @board.size
      @board[row] = [(row + 1).to_s, pins, "black pins: ", "white pins: "] 
    else
      row = @board.size - 1 # The last row with color pins on it
      @board[row][2] += pins[0]
      @board[row][3] += pins[1] 
    end
  end
end