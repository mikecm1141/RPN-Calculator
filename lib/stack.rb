# frozen_string_literal: true

## This class helps to manage the state and behavior of the stack the calculator
## will use to manage user given operands. I am pulling this out of the
## Calculator class itself to provide a layer of encapsulation for the data
## for this application.
class Stack
  attr_reader :operands

  def initialize
    @operands = []
  end

  def push(operand)
    operands.push(operand)
  end

  def clear
    operands.clear
  end

  def pop(quantity = 1)
    operands.pop(quantity)
  end

  def size
    operands.size
  end

  def last
    operands.last
  end
end
