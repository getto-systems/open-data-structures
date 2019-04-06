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
        assert_add index
        expand if size + 1 >= @array.length

        (size - index).times do |i|
          @array[size - i] = @array[size - i - 1]
        end

        @array[index] = value
        @size += 1

        nil
      end

      def remove(index)
        assert_index index
        target = @array[index]

        (size - index).times do |i|
          @array[index + i] = @array[index + i + 1]
        end

        @array[size] = nil
        @size -= 1

        shrink if size < @array.length / 3

        target
      end

      def push(value)
        add(@size,value)
      end

      def unshift(value)
        add(0,value)
      end

      def pop
        remove(@size - 1)
      end

      def shift
        remove(0)
      end

      private

        def expand
          resize(@array.length * 2)
        end

        def shrink
          resize(@array.length / 3)
        end

        def resize(length)
          length = 1 if length <= 0
          array = BackingArray.new(length: length)
          size.times do |i|
            array[i] = @array[i]
          end
          @array = array
        end

        def assert_index(index)
          raise ArgumentError, "index: #{index} / length: #{size}" if index < 0 or index >= size
        end
        def assert_add(index)
          raise ArgumentError, "index: #{index} / length: #{size}" if index < 0 or index >= size + 1
        end
    end
  end
end
