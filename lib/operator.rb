# frozen_string_literal: true

require_relative 'error'

## This class handles all operation actions that happen on the stack. These
## methods will raise an error if the stack size is too small or there is a
## problem with the operands themselves, such as if there is a zero for the
## divisor.
class Operator
  ## Takes the stack and adds the last two elements together.
  # @params [Stack]
  # @return [Float/Integer]
  def +(stack)
    valid_state?(stack)
    a, b = stack.pop(2)
    a + b
  end

  private

  def valid_state?(stack)
    if stack.size < 2
      raise StateError, 'Stack must have at least 2 operands for operation'
    end
  end
end
