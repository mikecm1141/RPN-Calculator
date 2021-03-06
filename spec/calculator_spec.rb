# frozen_string_literal: true

require './lib/calculator'

describe Calculator do
  before(:each) do
    subject { Calculator.new }
  end

  it 'exists' do
    expect(subject).to be_a(Calculator)
  end

  describe 'Instance Methods' do
    context '#current_stack' do
      it 'returns the current operands in the stack' do
        subject.parse_input('1')
        subject.parse_input('2')
        expect(subject.current_stack).to eq([1, 2])
      end
    end

    context '#clear_stack' do
      it 'returns the current operands in the stack' do
        subject.parse_input('1')
        subject.parse_input('2')
        subject.clear_stack
        expect(subject.current_stack).to be_empty
      end
    end

    context '#undo_last' do
      it 'removes the last operand from the stack' do
        subject.parse_input('1')
        subject.parse_input('2')
        subject.undo_last
        expect(subject.current_stack).to eq([1])
      end

      it 'raises an error if stack has no operands to remove' do
        expect { subject.undo_last }
          .to raise_error StateError, 'Stack is empty'
      end
    end

    context '#parse_input(input_string)' do
      context 'passing in an operand' do
        it 'parses the input string to add operands to the stack' do
          expect(subject.parse_input('1')).to be_truthy
          expect(subject.parse_input('2.3')).to be_truthy
          expect(subject.parse_input('-3')).to be_truthy
        end
      end

      context 'passing in an operator' do
        before(:each) do
          subject.parse_input('10')
          subject.parse_input('5')
        end

        it 'calculates given operation when passed a + operator' do
          expect(subject.parse_input('+')).to eq(15)
        end

        it 'calculates given operation when passed a - operator' do
          expect(subject.parse_input('-')).to eq(5)
        end

        it 'calculates given operation when passed a * operator' do
          expect(subject.parse_input('*')).to eq(50)
        end

        it 'calculates given operation when passed a / operator' do
          expect(subject.parse_input('/')).to eq(2)
        end
      end

      it 'raises error if given string is not valid at all' do
        expect { subject.parse_input('text') }
          .to raise_error(InputError, 'Invalid string input')
      end
    end
  end
end
