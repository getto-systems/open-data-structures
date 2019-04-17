require "chapter2/array_stack"

module OpenDataStructures::Chapter2
  module Practice
    module AddAll
      refine ArrayStack do
        def add_all(index, values)
          validate_add index

          value_length = values.length

          resize((length + value_length) * 2) if length + value_length >= @array.length

          (length - index + 1).times do |i|
            set (length + value_length - i), get(length - i)
          end

          value_length.times do |i|
            set (index + i), values[i]
          end

          @length += value_length
        end
      end
    end
  end
end
