# frozen_string_literal: true

## Module containing the comparisons for the case...end statement in the
## Calculator#parse_input method.
module InputType
  ## Checks the given input to see if it is a valid number. Works for both
  ## given integers and float values.
  class ValidOperand
    def self.===(input)
      [input.to_i.to_s, input.to_f.to_s].include?(input)
    end
  end

  ## Checks the given input to see if it is a valid operation.
  class ValidOperator
    OPERATORS = %r{(\+|\-|\*|\/)}.freeze

    def self.===(input)
      input =~ OPERATORS
    end
  end
end
