# frozen_string_literal: true

require_relative 'error'

class Operator
  def +(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a + b
  end

  def -(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a - b
  end

  def *(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a * b
  end

  def /(stack)
    valid_state?(stack)
    raise OperationError, 'Divisor cannot be zero' if stack.last.zero?

    a, b = stack.pop(2).map(&:to_f)
    result = a / b
    (result % 1.0).zero? ? result.to_i : result.to_f
  end

  private

  def valid_state?(stack)
    if stack.size < 2
      raise StateError, 'Stack must have at least 2 operands for operation'
    end
  end
end
