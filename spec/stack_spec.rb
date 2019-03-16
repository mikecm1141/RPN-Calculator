require './lib/stack'

describe Stack do
  it 'exists with standard attributes' do
    subject { Stack.new }

    expect(subject).to be_a(Stack)
    expect(subject.operands).to be_empty
  end
end
