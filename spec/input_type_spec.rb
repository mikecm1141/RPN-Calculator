# frozen_string_literal: true

require './lib/input_type'

describe InputType do
  describe InputType::ValidOperand do
    context '.===(input)' do
      it 'compares given input string to check for valid operand' do
        expect(InputType::ValidOperand.===('1')).to be true
        expect(InputType::ValidOperand.===('-3')).to be true
        expect(InputType::ValidOperand.===('10.5')).to be true
        expect(InputType::ValidOperand.===('-6.3')).to be true
      end

      it 'fails if given input string is not a valid operand' do
        expect(InputType::ValidOperand.===('text')).to be false
        expect(InputType::ValidOperand.===('?%#3')).to be false
      end
    end
  end

  describe InputType::ValidOperator do
    context '.===(input)' do
      it 'compares given input string to check for valid operation' do
        expect(InputType::ValidOperator.===('+')).to be_truthy
        expect(InputType::ValidOperator.===('-')).to be_truthy
        expect(InputType::ValidOperator.===('/')).to be_truthy
        expect(InputType::ValidOperator.===('*')).to be_truthy
      end

      it 'fails if given input is not a valid operation' do
        expect(InputType::ValidOperator.===('$')).to be_falsey
        expect(InputType::ValidOperator.===('&')).to be_falsey
        expect(InputType::ValidOperator.===('%')).to be_falsey
      end
    end
  end
end
