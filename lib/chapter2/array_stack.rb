require_relative "backing_array"

module OpenDataStructures
  module Chapter2
    class ArrayStack
      def initialize
        @length = 0
        @array = BackingArray.new(length: 1)
      end

      attr_reader :length

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
        expand if length + 1 >= @array.length

        (length - index).times do |i|
          @array[length - i] = @array[length - i - 1]
        end

        @array[index] = value
        @length += 1

        nil
      end

      def remove(index)
        assert_index index
        target = @array[index]

        (length - index).times do |i|
          @array[index + i] = @array[index + i + 1]
        end

        @array[length] = nil
        @length -= 1

        shrink if length < @array.length / 3

        target
      end

      def push(value)
        add(length,value)
      end

      def unshift(value)
        add(0,value)
      end

      def pop
        remove(length - 1)
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

        def resize(new_length)
          new_length = 1 if new_length <= 0
          new_array = BackingArray.new(length: new_length)
          length.times do |i|
            new_array[i] = @array[i]
          end
          @array = new_array
        end

        def assert_index(index)
          raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length
        end
        def assert_add(index)
          raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length + 1
        end
    end
  end
end
