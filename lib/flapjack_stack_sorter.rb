require 'flapjack_stack'

# A sorter for FlapjackStacks.
#
class FlapjackStackSorter
  attr_reader :stack

  def initialize(stack)
    @stack = stack
  end

  def sort
    return if stack.size <= 1

    # Track the prefix of the stack which we know to be sorted so far.
    #
    sorted = []

    stack.size.times do |position|
      value = stack[position]

      # So far, so good.
      #
      if sorted.empty? || value > sorted.last
        sorted << value

        next
      end

      # Where *should* the current value live?

      target_idx =
        sorted.find_index.each_with_index do |v, i|
          v >= value && (i.zero? || sorted[i - 1] <= value)
        end

      # Let's get it there.

      # Example: [1, 4, 3, 2, 5]

      # Flip the whole stack over, so we don't disturb the sorted prefix.

      stack.flip(stack.size)

      # [5, 2, 3, 4, 1]

      # Bring the current value to the top of the stack.

      stack.flip(stack.size - sorted.size)

      # [3, 2, 5, 4, 1]

      # Put the current value where it belongs.

      stack.flip(stack.size - target_idx)

      # [4, 5, 2, 3, 1]

      # Put the rest of the sorted prefix where it belongs.

      stack.flip(stack.size - (target_idx + 1))

      # [2, 5, 4, 3, 1]

      # Flip the whole stack back over.

      stack.flip(stack.size)

      # [1, 3, 4, 5, 2]

      sorted = stack.values.first(sorted.size + 1)
    end
  end
end
