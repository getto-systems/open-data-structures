require "chapter2/array_stack"

module OpenDataStructures::Chapter2
  class ArrayStack
    def addAll(index, values)
      assert_add index

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
