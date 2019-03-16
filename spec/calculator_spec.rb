# frozen_string_literal: true

require './lib/calculator'

describe Calculator do
  before(:each) do
    subject { Calculator.new }
  end

  it 'exists' do
    expect(subject).to be_a(Calculator)
  end
end
