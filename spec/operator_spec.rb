# frozen_string_literal: true

require './lib/operator'
require './lib/stack'

describe Operator do
  before(:each) do
    subject { Operator.new }
    @stack = Stack.new
    @stack.push(3).push(-10).push(2.5)
  end

  it 'exists' do
    expect(subject).to be_a(Operator)
  end

  describe 'Instance Methods' do
    context '#+(values)' do
      it 'takes stack values as input and adds last two values' do
        expect(subject.+(@stack)).to eq(-7.5)
      end

      it 'raises an error if stack size is too small for operation' do
        @stack.pop(2)
        expect { subject.+(@stack) }
          .to raise_error(
            StateError, 'Stack must have at least 2 operands for operation'
          )
      end
    end
  end
end
