module OpenDataStructures
  module Chapter2
    class BackingArray
      def initialize(length:)
        @length = length
        @array = Array.new(@length)
      end

      def [](index)
        assert_index index
        @array.at index
      end

      def []=(index,value)
        assert_index index
        @array[index] = value
      end

      private

        def assert_index(index)
          raise ArgumentError if index < 0 or index >= @length
        end
    end
  end
end
