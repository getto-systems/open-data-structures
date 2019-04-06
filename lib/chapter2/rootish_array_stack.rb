require "chapter2/array_stack"
require "chapter2/backing_array"

module OpenDataStructures
  module Chapter2
    class RootishArrayStack
      def initialize
        @length = 0
        @blocks = ArrayStack.new
      end

      attr_reader :length

      def blank
        block = @blocks.length
        block * (block + 1) / 2 - length
      end

      def [](index)
        assert_index index
        get index
      end

      def []=(index,value)
        assert_index index
        set index, value
      end

      def add(index,value)
        assert_add index
        grow if full?

        (length - index).times do |i|
          set (length - i), get(length - i - 1)
        end

        set index, value
        @length += 1

        nil
      end

      def remove(index)
        assert_index index
        target = get index

        (length - index - 1).times do |i|
          set (index + i), get(index + i + 1)
        end

        set length - 1, nil
        @length -= 1

        shrink if over?

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

        def get(index)
          block, inner = block_index index
          @blocks[block][inner]
        end

        def set(index,value)
          block, inner = block_index index
          @blocks[block][inner] = value
        end

        def block_index(index)
          block = ((-3.0 + Math.sqrt(9.0 + 8.0 * index)) / 2.0).ceil
          inner = index - (block*(block + 1))/2
          [ block, inner ]
        end

        def full?
          block = @blocks.length
          (block * (block + 1) / 2) <= length
        end

        def over?
          block = @blocks.length
          ((block - 2) * (block - 1) / 2) >= length
        end

        def grow
          @blocks.push BackingArray.new(length: @blocks.length + 1)
        end

        def shrink
          @blocks.pop
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
