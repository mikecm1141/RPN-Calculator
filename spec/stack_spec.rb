# frozen_string_literal: true

require './lib/stack'

describe Stack do
  before(:each) do
    subject { Stack.new }
  end

  it 'exists with standard attributes' do
    expect(subject).to be_a(Stack)
    expect(subject.operands).to be_empty
  end

  describe 'Instance Methods' do
    context '#push(operand)' do
      it 'pushes an operand to the end of the stack' do
        subject.push(2)
        subject.push(5)

        expect(subject.operands).to eq([2, 5])
      end
    end

    context '#clear' do
      it 'clears the current stack completely' do
        subject.push(2)
        subject.push(5)
        subject.clear

        expect(subject.operands).to be_empty
      end
    end

    context '#pop(quantity)' do
      it 'pops the given amount of operands off the stack' do
        subject.push(2)
        subject.push(5)

        expect(subject.pop(2)).to eq([2, 5])
      end
    end
  end
end
