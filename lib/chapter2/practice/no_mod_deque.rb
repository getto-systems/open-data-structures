require "chapter2/array_deque"

module OpenDataStructures::Chapter2
  class ArrayDeque
    alias_method :old_fit, :fit

    def fit(index)
      (index + @index) & (@array.length - 1)
    end
  end
end
