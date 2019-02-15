require 'rspec'
require 'flapjack_stack_sorter'

RSpec.describe FlapjackStackSorter do
  describe '#sort' do
    it 'returns a sorted FlapjackStack' do
      test_arrays = [
        [1],
        [1, 1],
        [1, 2],
        [2, 1],
        [5, 4, 3, 2, 1]
      ]

      test_arrays.each do |array|
        stack = FlapjackStack.new(array)

        sorter = FlapjackStackSorter.new(stack)

        sorter.sort

        expect(stack.sorted?).to eq(true)
      end
    end
  end
end
