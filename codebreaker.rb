# This class provides the basic functionality 
# for making guesses toward the code.
class Codebreaker
  
  # Creates a 4-element array of strings that represent
  # the 4 color code guess.
  def guess
    accepted_colors = "red green blue orange yellow brown".split
    valid_input = false

    until valid_input
      puts "Color Choices: RED GREEN BLUE ORANGE YELLOW BROWN"
      puts
      puts "Choose four colors separated by spaces. Each color" \
           " is allowed to be one of the six colors shown above."
      puts
      colors = gets.chomp.downcase.split
      puts

      if colors.size == 4
        colors.each do |color|
          unless accepted_colors.include?(color)
            puts "I can't read the colors you typed. Try again."
            puts
            valid_input = false
            break
          end
          valid_input = true
        end

      else
        puts "Please put in only four colors."
        puts
      end
    end
    p "This is what codebreaker.guess is returning: #{colors}"
    puts
    colors
  end
end