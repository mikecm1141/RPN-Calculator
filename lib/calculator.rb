# frozen_string_literal: true

%w[stack input_type].map { |file| require_relative file }

## The main driver of the application. This is separated from the class that
## drives the CLI for the RPN Calculator. This is the entry point through
## which the Stack is manipulated by adding and removing operands, and though
## which operators are processed for calculation.
class Calculator
  def initialize
    @stack = Stack.new
  end

  ## Drives the calculator through user input provided via this method.
  # @params [String] -> ex. '1', '2.3', '-1', '-30.335'
  # @return [Float/Integer]
  def parse_input(input_string)
    case input_string
    when InputType::ValidOperand
      stack.push(input_string)
    when InputType::ValidOperator
      ## execute_operation method will be called here
      'valid'
    else
    end
  end

  private

  attr_reader :stack
end
