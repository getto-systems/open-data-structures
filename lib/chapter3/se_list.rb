require "chapter2/array_deque"

module OpenDataStructures
  module Chapter3
    class SEList
      class FixedDeque < Chapter2::ArrayDeque
        def initialize(length:)
          super()

          @array = Chapter2::BackingArray.new(length: length+1)
        end

        private

          def resize(size)
            # noop
          end
      end

      class Node
        def initialize(block)
          @block = block
        end

        attr_reader :block
        attr_accessor :next, :previous

        def loop?
          false
        end

        def insert_before(node)
          self.previous.next = node

          node.previous = self.previous
          node.next = self

          self.previous = node

          node
        end

        def remove!
          self.previous.next = self.next
          self.next.previous = self.previous
        end
      end

      class ValueNode < Node
        def initialize(length:)
          super(FixedDeque.new(length: length))
        end
      end

      class LoopNode < Node
        def initialize
          super(FixedDeque.new(length: 0))

          @next = self
          @previous = self
        end

        def loop?
          true
        end
      end

      def initialize(block_size:)
        raise ArgumentError, "block_size must be larger then 2" if block_size < 2

        @length = 0

        @block_size = block_size

        @loop = LoopNode.new
      end

      attr_reader :length, :block_size

      def [](index)
        validate_index index

        node, i = find index
        node.block[i]
      end

      def []=(index,value)
        validate_index index

        node, i = find index
        node.block[i] = value
      end

      def add(index,value)
        validate_add index

        if index == length
          last = @loop.previous
          if last.loop? or last.block.length == block_size + 1
            last = @loop.insert_before new_node
          end
          last.block.push value
          @length += 1
        else
          node, i = find index
          target = node

          full_count = 0

          block_size.times do
            break if node.loop?
            break unless node.block.length == block_size + 1

            full_count += 1
            node = node.next
          end

          if full_count == block_size
            spread target
            node = target
          end

          if node.loop?
            node = @loop.insert_before new_node
          end

          while node != target
            node.block.unshift node.previous.block.pop
            node = node.previous
          end

          node.block.add i, value
          @length += 1
        end

        nil
      end

      def remove(index)
        validate_index index

        node, i = find index

        under_count = 0

        target = node
        block_size.times do
          break if target.loop?
          break unless target.block.length == block_size - 1

          under_count += 1
          target = target.next
        end

        if under_count == block_size
          gather node
        end

        value = node.block.remove i

        target = node
        while target.block.length < block_size - 1
          break if target.next.loop?
          target.block.push target.next.block.shift
          target = target.next
        end

        if target.block.length == 0
          target.remove!
        end

        @length -= 1

        value
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

        def find(index)
          if index < length/2
            node = @loop.next

            search = index
            while search >= node.block.length
              break if node.loop?
              search -= node.block.length
              node = node.next
            end
          else
            node = @loop.previous

            search = length - index - 1
            while search >= node.block.length
              break if node.loop?
              search -= node.block.length
              node = node.previous
            end
            search = node.block.length - search - 1
          end

          [ node, search ]
        end

        def new_node
          ValueNode.new(length: block_size)
        end

        def spread(node)
          target = node
          block_size.times do
            target = target.next
          end

          target = target.insert_before new_node
          while target != node
            while target.block.length < block_size
              target.block.unshift target.previous.block.pop
            end
            target = target.previous
          end
        end

        def gather(node)
          target = node
          (block_size - 1).times do
            while target.block.length < block_size
              target.block.push target.next.block.shift
            end
            target = target.next
          end
          target.remove!
        end

        def validate_index(index)
          raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length
        end
        def validate_add(index)
          raise ArgumentError, "index: #{index} / length: #{length}" if index < 0 or index >= length + 1
        end
    end
  end
end
