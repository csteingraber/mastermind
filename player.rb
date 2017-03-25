# This class contains  the logic for receiving sanitized color
# inputs from the user as well as the logic for generating
# random color codes. This class is to be inherited by the 
# Codemaker and Codebreaker classes.
class Player
    @@accepted_colors = "red green blue orange yellow brown".split

    # Creates a 4-element array of strings that represent
    # the 4 color code guess.
    def input
    valid_input = false

    until valid_input
      puts "Color Choices: RED GREEN BLUE ORANGE YELLOW BROWN"
      puts
      puts "Choose four colors separated by spaces. Each color" \
           " is allowed to be one of the six colors shown above." \
           " The four colors are allowed to repeat."
      puts
      colors = gets.chomp.downcase.split
      puts

      if colors.size == 4
        colors.each do |color|
          unless @@accepted_colors.include?(color)
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
    colors
  end

  # Creates and returns an array of four random colors.
  def generate_code
    code = []

    4.times do 
      code << @@accepted_colors.sample
    end

    code
  end
end