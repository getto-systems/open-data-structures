require "chapter3/dl_list"

module OpenDataStructures::Chapter3
  module Practice
    class MinStack
      def initialize
        @stack = DLList.new
        @min_stack = DLList.new
      end

      def push(value)
        @stack.push value

        if @min_stack.length == 0 or value < @min_stack[0][:value]
          @min_stack.unshift ref(value)
        end

        nil
      end

      def pop
        value = @stack.pop

        if @min_stack[0][:index] == @stack.length
          @min_stack.shift
        end

        value
      end

      def length
        @stack.length
      end

      def min
        return nil if length == 0
        @min_stack[0][:value]
      end

      private

        def ref(value)
          {
            index: @stack.length - 1,
            value: value,
          }
        end
    end
  end
end
