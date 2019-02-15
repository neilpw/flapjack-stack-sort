require 'rspec'
require 'flapjack_stack'

RSpec.describe FlapjackStack do
  describe '#flip' do
    it 'validates input bounds' do
      stack = FlapjackStack.new([1, 2, 3])

      expect { stack.flip(-1) }.to raise_error(ArgumentError)
      expect { stack.flip(4) }.to raise_error(ArgumentError)
    end

    it 'flips a full stack' do
      stack = FlapjackStack.new([1, 2, 3])

      stack.flip(3)

      expect(stack.values).to eq([3, 2, 1])
    end

    it 'flips from the midpoint of an even-sized stack' do
      stack = FlapjackStack.new([1, 2, 3, 4])

      stack.flip(2)

      expect(stack.values).to eq([2, 1, 3, 4])
    end
  end

  describe '#sorted?' do
    it 'returns true for sorted stacks' do
      stack = FlapjackStack.new([1, 2, 3])

      expect(stack.sorted?).to eq(true)
    end

    it 'returns false for unsorted stacks' do
      stack = FlapjackStack.new([2, 1, 3])

      expect(stack.sorted?).to eq(false)
    end
  end

  describe '#to_s' do
    it 'returns the values array as a string' do
      stack = FlapjackStack.new([1, 2, 3])

      expect(stack.to_s).to eq('[1, 2, 3]')
    end
  end

  describe '#size' do
    it 'returns the size of the values array' do
      stack = FlapjackStack.new([1, 2, 3])

      expect(stack.size).to eq(3)
    end
  end
end
