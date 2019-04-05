require_relative "backing_array"

module OpenDataStructures
  module Chapter2
    class ArrayStack
      def init
        @size = 0
        @array = BackingArray.new(length: 1)
      end

      def size
        @size
      end

      def get(index)
        @array[index]
      end

      def set(index,value)
        @array[index], old = value, @array[index]
        old
      end
    end
  end
end
