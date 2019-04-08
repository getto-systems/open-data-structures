module OpenDataStructures
  module Chapter2
    class BackingArray
      def initialize(length:)
        @length = length
        @array = Array.new(@length)
      end

      attr_reader :length

      def [](index)
        validate_index index
        @array.at index
      end

      def []=(index,value)
        validate_index index
        @array[index] = value
      end

      private

        def validate_index(index)
          raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length
        end
    end
  end
end
