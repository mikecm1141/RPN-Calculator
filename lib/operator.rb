# frozen_string_literal: true

require_relative 'error'

## This class handles all operation actions that happen on the stack. These
## methods will raise an error if the stack size is too small or there is a
## problem with the operands themselves, such as if there is a zero for the
## divisor.
class Operator
  ## Takes the stack and adds the last two elements.
  # @params [Stack]
  # @return [Float/Integer]
  def +(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a + b
  end

  ## Takes the stack and subtracts the last two elements.
  # @params [Stack]
  # @return [Float/Integer]
  def -(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a - b
  end

  ## Takes the stack and multiplies the last two elements.
  # @params [Stack]
  # @return [Float/Integer]
  def *(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a * b
  end

  ## Takes the stack and divides the last two elements. This will fail if the
  ## divisor is zero. This method converts the two operands to floats so that
  ## (not much) precision is lost when dividing two operands that may not result
  ## in having no remainder. Returns the result of this as either an integer
  ## if it is a whole number, or a float if it is not.
  # @params [Stack]
  # @return [Float/Integer]
  def /(stack)
    valid_state?(stack)
    raise OperationError, 'Divisor cannot be zero' if stack.last.zero?

    a, b = stack.pop(2).map(&:to_f)
    result = a / b
    (result % 1.0).zero? ? result.to_i : result.to_f
  end

  private

  ## Checks the given stack to verify that there are at least 2 operands in
  ## the given stack. Raises a StateError if stack size is too small.
  # @params [Stack]
  def valid_state?(stack)
    if stack.size < 2
      raise StateError, 'Stack must have at least 2 operands for operation'
    end
  end
end
