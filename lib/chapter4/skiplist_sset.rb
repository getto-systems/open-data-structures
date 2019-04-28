module OpenDataStructures
  module Chapter4
    class SkiplistSSet
      class Node
        def initialize(value:, height:)
          @value = value
          @height = height
          @next = []
        end

        attr_accessor :height
        attr_reader :value, :next

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

      def find(value)
        if node = findPredecessor(value)
          if target = node.next[0]
            target.value
          end
        end
      end

      def add(value)
        node = @sentinel
        level = height
        stack = []
        while level >= 0
          while node.next[level] && node.next[level].value <= value
            return false if node.next[level].value == value
            node = node.next[level]
          end
          stack[level] = node
          level -= 1
        end

        new_node = Node.new value: value, height: generateHeight

        while @sentinel.height < new_node.height
          @sentinel.height += 1
          stack[@sentinel.height] = @sentinel
        end

        (new_node.height + 1).times do |i|
          new_node.next[i] = stack[i].next[i]
          stack[i].next[i] = new_node
        end

        @length += 1

        true
      end

      def remove(value)
        is_removed = false
        node = @sentinel
        level = height
        while level >= 0
          while node.next[level] && node.next[level].value < value
            node = node.next[level]
          end

          if node.next[level] && node.next[level].value == value
            is_removed = true
            node.next[level] = node.next[level].next[level]
            if node.sentinel? && !node.next[level]
              @sentinel.height -= 1
            end
          end

          level -= 1
        end

        if is_removed
          @length -= 1
        end

        is_removed
      end

      private

        def findPredecessor(value)
          node = @sentinel
          level = height
          while level >= 0
            while node.next[level] && node.next[level].value < value
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
    end
  end
end
