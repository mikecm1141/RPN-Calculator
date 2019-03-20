# frozen_string_literal: true

%w[stack input_type error operator].map { |file| require_relative file }

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

  def undo_last
    raise StateError, 'Stack is empty' if stack.size.zero?

    stack.pop
  end

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

  def execute_operation(input_string)
    action = input_string.to_sym
    raise OperationError, 'Invalid operator' unless operator.respond_to?(action)

    result = operator.send(action, stack)
    stack.push(result)
    result
  end

  def operator
    @operator ||= Operator.new
  end

  def convert_input(number_string)
    (number_string.to_f % 1.0).zero? ? number_string.to_i : number_string.to_f
  end
end
