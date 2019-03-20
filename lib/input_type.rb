# frozen_string_literal: true

module InputType
  class ValidOperand
    def self.===(input)
      [input.to_i.to_s, input.to_f.to_s].include?(input)
    end
  end

  class ValidOperator
    OPERATORS = %w[+ - * /].freeze

    def self.===(input)
      OPERATORS.include?(input)
    end
  end
end
