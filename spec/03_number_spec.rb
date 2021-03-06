# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/BlockLength

# In a typical work-flow, the class being tested will be located in a different file.
# But for this simple example, let's keep everything together.
class SingleDigit
  attr_accessor :number

  def initialize
    @number = rand(1..9)
  end
end

describe SingleDigit do
  # Comparison matchers are used with 'be' matcher
  # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/comparison-matchers

  # There can be multiple tests in one example block
  it 'is greater than or equal to 1 and less than 10' do
    # Remember 'subject' can be implicitly defined when the outermost example group is a class.
    expect(subject.number).to be >= 1
    expect(subject.number).to be < 10
  end

  context 'when tests can be compounded' do
    it 'is greater than 0 and less than 10' do
      # side note: rspec would run, but rubocop didnt like (be >= 1).and be < 6
      expect(subject.number).to be_positive.and be < 10
    end

    context 'when random number is 3' do
      it 'is odd and less than 10' do
        # Note: the number attribute must have a setter method (for example: attr_accessor).
        subject.number = 3
        expect(subject.number).to be_odd.and be < 10
      end
    end
  end

  # Instead of using .to, you can use the inverse built in matcher .not_to
  context 'when using not_to' do
    it 'is not equal to 10' do
      expect(subject.number).not_to eq(10)
    end
    it 'is not equal to 0' do
      expect(subject.number).not_to be_zero
    end
    it 'is not nil' do
      expect(subject.number).not_to be_nil
    end
  end
end

# ASSIGNMENT

describe Array do
  xit 'is empty' do
    # Write a test that verifies if subject is empty
  end

  context 'when my_array has perfect values' do
    # Write a let variable 'my_array' that passes all tests

    # remove the 'x' before running this test
    xit 'has specific first and last values' do
      expect(my_array.first).to be_odd.and be <= -1
      expect(my_array.last).to be_even.and be < 99
    end

    # remove the 'x' before running this test
    xit 'has specific min and max values' do
      expect(my_array.min).not_to be < -9
      expect(my_array.max).to be > 100
    end

    # remove the 'x' before running this test
    xit 'includes a value of 42' do
      expect(my_array).to include(42)
    end

    # remove the 'x' before running this test
    xit 'has a fourth element' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
# rubocop:enable Layout/LineLength, Metrics/BlockLength
