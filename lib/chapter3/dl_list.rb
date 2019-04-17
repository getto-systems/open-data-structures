module OpenDataStructures
  module Chapter3
    class DLList
      class Node
        def initialize(value)
          @value = value
        end

        attr_accessor :next, :previous, :value

        def loop?
          false
        end

        def insert_before(node)
          self.previous.next = node

          node.previous = self.previous
          node.next = self

          self.previous = node
        end

        def remove!
          self.previous.next = self.next
          self.next.previous = self.previous

          value
        end
      end

      class LoopNode < Node
        def initialize
          super(nil)

          @next = self
          @previous = self
        end

        def loop?
          true
        end
      end

      def initialize
        @length = 0

        @loop = LoopNode.new
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

        find(index).insert_before Node.new(value)
        @length += 1

        nil
      end

      def remove(index)
        validate_index index

        node = find(index)
        value = node.remove!
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
          node = @loop

          if index > length/2
            (length - index).times do
              node = node.previous
            end
          else
            (index + 1).times do
              node = node.next
            end
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
