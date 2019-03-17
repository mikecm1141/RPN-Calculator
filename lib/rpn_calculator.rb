# frozen_string_literal: true

require_relative 'calculator'

class RpnCalculator
  def self.run
    calculator = Calculator.new
    puts <<-HEADERMSG

    Welcome to the RPN calculator. See the README for more information on
    proper usage of this application.

    Enter 'c' to clear the current operand stack.
    Enter 'v' to view the current operand stack.
    Enter 'z' to remove the last number on the stack.
    Enter 'q' to quit the application.

    HEADERMSG
    loop do
      print '$:> '
      user_input = STDIN.gets.chomp.downcase
      if user_input == 'q'
        puts 'Terminating application, goodbye'
        exit
      end

      p calculator.parse_input(user_input)
    end
  end
end
