# frozen_string_literal: true

require_relative 'calculator'

class RpnCalculator
  def self.run
    loop do
      print rpnc.prompt
      user_input = STDIN.gets.chomp.downcase

      if user_input == 'q'
        rpnc.menu_options[user_input.to_sym].call
        next
      end

      p rpnc.parse_input(user_input)

      p rpnc.send_input(user_input)
    rescue StandardError => e
      puts "\s\sError: #{e.message}"
    end
  end

  def self.rpnc
    @rpnc ||= RpnCalculator.new
  end

  attr_reader :calculator

  def initialize
    @calculator = Calculator.new
    puts header
  end

  def send_input(input_string)
    calculator.parse_input(input_string)
  end
  def menu_options
    {
      q: method(:option_quit_program)
    }
  end

  def option_quit_program
    puts "\s\sTerminating application"
    exit
  end

  def header
    <<-HEADERMSG

    Welcome to the RPN calculator. See the README for more information on
    proper usage of this application.

    Enter 'c' to clear the current operand stack.
    Enter 'v' to view the current operand stack.
    Enter 'z' to remove the last number on the stack.
    Enter 'q' to quit the application.

    HEADERMSG
  end

  def prompt
    '$:> '
  end
end
