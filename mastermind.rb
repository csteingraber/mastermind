require "./board"
require "./codemaker"
require "./codebreaker"

# This class ascts as the container for all of
# the game pices: the Board, the Codemaker, and
# the Codebreaker. It also acts as the instantiator
# of the above mentioned objects and mediates 
# gameplay.
class Mastermind

  # Creates new Board, Codebreaker, and Codemaker
  # objects and starts a loop until the code is cracked
  # or there are no more turns left.
  def initialize
    @board = Board.new
    @codemaker = Codemaker.new
    @codebreaker = Codebreaker.new
    start
  end

  # Starts a loop until the code is cracked
  # or there are no more turns left.
  def start
    win = false
    12.times do
      guess = @codebreaker.guess
      feedback = @codemaker.give_feedback(guess)
      win = feedback[0] == "4" ? true : false
      p "guess inside of Mastermind is: #{guess}"
      puts
      @board.add(guess)
      p "board looks like this after @board.add(guess): #{@board.board}"
      puts
      @board.add(feedback)
      p "board looks like this after @board.add(feedback): #{@board.board}"
      puts
      @board.print_board
      break if win
    end

    if win
      puts "You won!"
    else
      puts "You lost!"
    end
  end
end

Mastermind.new