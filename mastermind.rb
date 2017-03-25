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
    codemaker_user = @codemaker.user
    12.times do
      guess = codemaker_user == "computer" ?  @codebreaker.input : @codebreaker.computer_guess(@board.board[-1])
      feedback = @codemaker.give_feedback(guess)
      win = feedback[0] == "4" ? true : false
      @board.add(guess)
      @board.add(feedback)
      @board.print_board if codemaker_user == "computer"
      break if win
    end

    if win
      if codemaker_user == "computer"
        puts "You won!"
      else
        puts "Computer won!"
        @board.print_board
      end
    else
      if codemaker_user == "computer"
        puts "You lost!"
      else
        puts "Computer lost!"
        @board.print_board
      end
    end
  end
end

Mastermind.new