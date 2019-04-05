require_relative "backing_array"

module OpenDataStructures
  module Chapter2
    class ArrayStack
      def initialize
        @size = 0
        @array = BackingArray.new(length: 1)
      end

      attr_reader :size

      def get(index)
        assert_index index
        @array[index]
      end

      def set(index,value)
        assert_index index
        @array[index], old = value, @array[index]
        old
      end

      def add(index,value)
        expand if size + 1 >= @array.length

        if index < size
          (size - index).times do |i|
            @array[size - i] = @array[size - i - 1]
          end
        end

        @array[index] = value
        @size += 1

        nil
      end

      def remove(index)
        target = @array[index]

        if index < size
          (size - index).times do |i|
            @array[index + i] = @array[index + i + 1]
          end
        end

        @array[size] = nil
        @size -= 1

        shrink if size < @array.length / 3

        target
      end

      private

        def expand
          resize(
            if @array.length > 0
              @array.length * 2
            else
              1
            end
          )
        end

        def shrink
          resize(@array.length / 2)
        end

        def resize(length)
          array = BackingArray.new(length: length)
          size.times do |i|
            array[i] = @array[i]
          end
          @array = array
        end

        def assert_index(index)
          raise ArgumentError if index < 0 or index >= size
        end
    end
  end
end
