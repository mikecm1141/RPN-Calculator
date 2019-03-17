# frozen_string_literal: true

require './lib/operation'

describe Operation do
  it 'exists' do
    subject { Operation.new }

    expect(subject).to be_a(Operation)
  end
end
