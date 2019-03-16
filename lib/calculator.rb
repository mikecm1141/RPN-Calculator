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
end
