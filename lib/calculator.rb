# frozen_string_literal: true

%w[stack input_type error operator].map { |file| require_relative file }

## The main driver of the application. This is separated from the class that
## drives the CLI for the RPN Calculator. This is the entry point through
## which the Stack is manipulated by adding and removing operands, and though
## which operators are processed for calculation.
class Calculator
  def initialize
    @stack = Stack.new
  end

  def current_stack
    stack.operands
  end

  def clear_stack
    stack.clear
  end

  ## Removes the last pushed operand from the stack. Raises a StateError if
  ## there are no operands to remove from the stack.
  def undo_last
    raise StateError, 'Stack is empty' if stack.size == 0

    stack.pop
  end

  ## Drives the calculator through user input provided via this method.
  # @params [String] -> ex. '1', '2.3', '-1', '-30.335'
  # @return [Case 1: [Array], Case 2: [Float/Integer]
  def parse_input(input_string)
    case input_string
    when InputType::ValidOperand
      stack.push(convert_input(input_string))
    when InputType::ValidOperator
      execute_operation(input_string)
    else
      raise InputError, 'Invalid string input'
    end
  end

  private

  attr_reader :stack

  ## When an operator is given to #parse_input, this method will run the
  ## given calculation. Raises error if somehow an invalid operator is passed
  ## into this method.
  # @params [String]
  # @return [Float/Integer]
  def execute_operation(input_string)
    action = input_string.to_sym
    raise OperationError, 'Invalid operator' unless operator.respond_to?(action)

    result = operator.send(action, stack)
    stack.push(result)
    result
  end

  ## This doesn't need to be instantiated more than one time, so I have
  ## memoized it here in order to make sure that it is only done initially upon
  ## first use.
  def operator
    @operator ||= Operator.new
  end

  ## Checks if the given number string is either an integer or a float, and
  ## converts the number string to the given type.
  # @params [String]
  # @return [Float/Integer]
  def convert_input(number_string)
    (number_string.to_f % 1.0).zero? ? number_string.to_i : number_string.to_f
  end
end
