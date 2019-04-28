module OpenDataStructures
  module Chapter4
    class SkiplistList
      class Node
        def initialize(value:, height:)
          @value = value
          @height = height
          @next = []
          @length = []
        end

        attr_accessor :height, :value
        attr_reader :next, :length

        def sentinel?
          false
        end
      end

      class SentinelNode < Node
        def initialize
          super(value: nil, height: 0)
        end

        def sentinel?
          true
        end
      end

      MAX_HEIGHT = 2**32

      def initialize(random:)
        @random = random
        @sentinel = SentinelNode.new
        @length = 0
      end

      attr_reader :length

      def height
        @sentinel.height
      end

      def [](index)
        validate_index index
        findPredecessor(index).next[0].value
      end
      def []=(index, value)
        validate_index index
        findPredecessor(index).next[0].value = value
      end

      def add(index, value)
        new_node = Node.new value: value, height: generateHeight

        if new_node.height > @sentinel.height
          @sentinel.height = new_node.height
        end

        node = @sentinel
        level = height
        current = -1
        while level >= 0
          while node.next[level] && node.length[level] && current + node.length[level] < index
            current += node.length[level]
            node = node.next[level]
          end

          node.length[level] ||= 0
          node.length[level] += 1

          if level <= new_node.height
            new_node.next[level] = node.next[level]
            node.next[level] = new_node

            new_node.length[level] = node.length[level] - (index - current)
            node.length[level] = index - current
          end
          level -= 1
        end

        @length += 1

        nil
      end

      def remove(index)
        value = nil
        node = @sentinel
        level = height
        current = -1
        while level >= 0
          while node.next[level] && node.length[level] && current + node.length[level] < index
            current += node.length[level]
            node = node.next[level]
          end

          node.length[level] -= 1

          if current + node.length[level] + 1 == index && node.next[level]
            value = node.next[level].value
            node.length[level] += node.next[level].length[level]
            node.next[level] = node.next[level].next[level]
            if node.sentinel? && !node.next[level]
              @sentinel.height -= 1
            end
          end

          level -= 1
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

        def findPredecessor(index)
          node = @sentinel
          level = height
          current = -1
          while level >= 0
            while node.next[level] && node.length[level] && current + node.length[level] < index
              current += node.length[level]
              node = node.next[level]
            end
            level -= 1
          end
          node
        end

        def generateHeight
          random = @random.rand(MAX_HEIGHT)
          height = 0
          base = 1
          while (random & base) != 0
            height += 1
            base <<= 1
          end
          height
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
