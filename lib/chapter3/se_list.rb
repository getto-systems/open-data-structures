require "chapter3/dl_list"

module OpenDataStructures
  module Chapter3
    class SEList
      class Node
        def initialize
          @block = DLList.new
        end

        attr_reader :block
        attr_accessor :next, :previous

        def loop?
          false
        end

        def insert_before
          node = Node.new

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

      class LoopNode < Node
        def initialize
          super

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
          node = @loop.previous
          if node.loop? or node.block.length == block_size + 1
            node = @loop.insert_before
          end
          i = node.block.length
        else
          node, i = find index

          full_count = node_count node, block_size + 1

          if full_count == block_size
            spread node
          end

          shift_after_add node, full_count
        end

        node.block.add i, value
        @length += 1

        nil
      end

      def remove(index)
        validate_index index

        node, i = find index

        under_count = node_count node, block_size - 1

        if under_count == block_size
          gather node
        end

        value = node.block.remove i

        shift_after_remove node

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

        def node_count(node, size)
          count = 0

          block_size.times do
            break if node.loop?
            break unless node.block.length == size

            count += 1
            node = node.next
          end

          count
        end

        def spread(node)
          target = node
          block_size.times do
            target = target.next
          end

          target = target.insert_before
          while target != node
            while target.block.length < block_size
              target.block.unshift target.previous.block.pop
            end
            target = target.previous
          end
        end

        def shift_after_add(node, full_count)
          target = node
          full_count.times do
            target = target.next
          end

          if target.loop?
            target = target.insert_before
          end

          while target != node
            target.block.unshift target.previous.block.pop
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

        def shift_after_remove(node)
          while node.block.length < block_size - 1
            break if node.next.loop?
            node.block.push node.next.block.shift
            node = node.next
          end

          if node.block.length == 0
            node.remove!
          end
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
