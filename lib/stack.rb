# frozen_string_literal: true

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
