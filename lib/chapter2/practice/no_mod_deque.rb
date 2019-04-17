require "chapter2/array_deque"

module OpenDataStructures::Chapter2
  module Practice
    module NoModDeque
      refine ArrayDeque do
        alias_method :old_fit, :fit

        def fit(index)
          (index + @index) & (@array.length - 1)
        end
      end
    end
  end
end
