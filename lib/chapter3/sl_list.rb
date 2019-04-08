module OpenDataStructures
  module Chapter3
    class SLList
      class Node
        def initialize(value)
          @value = value
        end

        attr_accessor :next, :value

        def insert_after(node)
          if self.next
            self.next, node.next = node, self.next
          else
            self.next = node
          end
        end

        def remove_next
          nextNode = self.next

          if nextNode
            self.next = nextNode.next
          end

          nextNode
        end
      end

      def initialize
        @length = 0
      end

      attr_reader :length

      def [](index)
        validate_index index
        find(index).value
      end

      def []=(index,value)
        validate_index index
        find(index).value = value
      end

      def add(index,value)
        validate_add index

        node = Node.new value

        if index == 0
          node.insert_after @head

          @head = node
        else
          find(index - 1).insert_after node
        end

        @length += 1

        nil
      end

      def remove(index)
        validate_index index

        if index == 0
          target = @head
          @head = target.next
        else
          target = find(index - 1).remove_next
        end

        value = target.value

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
          node = @head
          index.times do
            node = node.next
          end
          node
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
