# A stack of flapjacks, modeled as an array of integers.
#
class FlapjackStack
  attr_reader :values

  def initialize(values)
    @values = values
  end

  def [](idx)
    @values[idx]
  end

  def size
    @values.size
  end

  def sorted?
    @values.sort == @values
  end

  # Inserts a spatula into the stack of flapjacks and flips the sub-stack above
  # the spatula.
  #
  def flip(pos)
    # NB: For the purposes of this exercise, we consider flip position 0 to be
    # trivial rather than invalid.
    #
    unless (0..@values.size).cover?(pos)
      raise ArgumentError, "Invalid flip position: #{pos}"
    end

    # On the first iteration of this loop, we swap the positions of the top
    # pancake  on the stack and the bottommost pancake to be flipped.
    #
    # From there, we work our way inward, until the flip is complete.
    #
    (pos / 2).times do |i|
      @values[i], @values[pos - (i + 1)] = @values[pos - (i + 1)], @values[i]
    end

    values
  end

  def to_s
    @values.to_s
  end
end
